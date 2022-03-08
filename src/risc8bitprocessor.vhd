library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity RISC8BITPROCESSOR is
	port(
		clk, reset : in std_logic;
		pc_out, alu_result : out std_logic_vector(7 downto 0);
		register1_out, register2_out : out std_logic_vector(7 downto 0)
	);
end RISC8BITPROCESSOR;

architecture Behavioral of RISC8BITPROCESSOR is
	signal pc_current, pc2, pc_next : std_logic_vector(7 downto 0);
	signal pc_jump, pc_mux_out : std_logic_vector(7 downto 0);
	signal instruction :std_logic_vector(7 downto 0);
	signal ALU_out :std_logic_vector(7 downto 0);
	signal ALU_control_out : std_logic_vector(3 downto 0);
	signal alu_op : std_logic_vector(2 downto 0);
	signal ALU_src, mem_read, mem_write_en, reg_write_li, reg_write_en, branch, zero_flag, jump, and_branch_alu: std_logic;
	signal reg_read_data_1, reg_read_data_2, a, b, mem_read_data, mux_memAlu_out, reg_write_data_li : std_logic_vector(7 downto 0);
	
	begin process(clk, reset)
		begin if(reset='1') then
			pc_current <= "00000000";
		elsif(rising_edge(clk)) then
			pc_current <= pc_next;
		end if;
	end process;
	
	PC_Add : entity work.PC_ADD_VHDL port map(
		pc_current => pc_current,
		pc2 => pc2
	);
	
	Instruction_Memory : entity work.INSTRUCTION_MEMORY_VHDL port map(
		pc => pc_current,
		instruction => instruction
	);

	pc_jump <= "000" & instruction(4 downto 0);
	
	Control_Unit : entity work.CONTROL_UNIT_VHDL port map(
		opcode => instruction(7 downto 5),
		reset => reset,
		ALU_op => ALU_op,
		jump => jump,
		mem_read => mem_read,
		mem_write_en => mem_write_en,
		reg_write_li => reg_write_li,
		reg_write_en => reg_write_en,
		branch => branch,
		ALU_src => ALU_src
	);
	
	reg_write_data_li <=  "00000" & instruction(2 downto 0) when (reg_write_li = '1') else "00000000";
	
	Register_File : entity work.REGISTER_FILE_VHDL port map(
		clk => clk,
		rst => reset,
		reg_write_en => reg_write_en,
		reg_write_dest => instruction(4 downto 3),
		reg_write_data => mux_memAlu_out,
		reg_write_li => reg_write_li,
		reg_write_data_li => reg_write_data_li,
		reg_read_addr_1 => instruction(4 downto 3),
		reg_read_data_1 => reg_read_data_1,
		reg_read_addr_2 => instruction(2 downto 1),
		reg_read_data_2 => reg_read_data_2
	);
	
	a <= reg_read_data_1;
	b <= reg_read_data_2;
	
	
	ALU_control : entity work.ALU_CONTROL_VHDL port map(
		Alu_op => Alu_op,
		ALU_Funct => instruction(0),
		ALU_control => ALU_control_out
	);
	ALU : entity work.ALU_VHDL port map(
		a => a,
		b => b,
		alu_op => ALU_control_out,
		alu_result => ALU_out,
		zero_flag => zero_flag 
	);
	
	Data_Memory : entity work.DATA_MEMORY_VHDL port map(
		clk => clk,
		mem_access_addr => reg_read_data_2,
		mem_write_data => reg_read_data_1,
		mem_write_en => mem_write_en,
		mem_read => mem_read,
		mem_read_data => mem_read_data
	);
	
	mux_memAlu_out <= mem_read_data when (mem_read = '1') else alu_out;
	
	Jump_Mux : entity work.JUMP_MUX_VHDL port map(
		jump => jump,
		pc_jump => pc_jump,
		pc2 => pc2,
		pc_out => pc_mux_out
	);
	
	and_branch_alu <= branch and zero_flag;
	
	Branch_Mux : entity work.BRANCH_MUX_VHDL port map(
		en => and_branch_alu,
		-- offset : in std_logic;
		pc_next => pc_mux_out,
		pc_out => pc_next
	);
	
	
	
	pc_out <= pc_current;
	
	ALU_result <= ALU_out;
	register1_out <= reg_read_data_1;
	register2_out <= reg_read_data_2;
	
end Behavioral;