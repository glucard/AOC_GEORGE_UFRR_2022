LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity testbench is 
end testbench;

architecture behavior of testbench is
	component RISC8BITPROCESSOR port(
		clk : in std_logic;
		reset : in std_logic;
		pc_out : out std_logic_vector(7 downto 0);
		alu_result : out std_logic_vector(7 downto 0);
		register1_out : out std_logic_vector(7 downto 0);
		register2_out : out std_logic_vector(7 downto 0);
		mem_read_out, mem_write_en_out, reg_write_li_out, reg_write_en_out, immediate_en_out, immediate_en_gate_out, branch_out, zero_flag_out, jump_out, and_branch_alu_out: out std_logic;
		instruction_out : out std_logic_vector(7 downto 0)
	);
	end component;
	
	signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   --Outputs
   signal pc_out : std_logic_vector(7 downto 0);
   signal alu_result : std_logic_vector(7 downto 0);
   signal register1_out, register2_out, instruction_out : std_logic_vector(7 downto 0);
	signal mem_read_out, mem_write_en_out, reg_write_li_out, reg_write_en_out, immediate_en_out, immediate_en_gate_out, branch_out, zero_flag_out, jump_out, and_branch_alu_out: std_logic;
   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
BEGIN
 -- Instantiate the for the single-cycle MIPS Processor in VHDL
   uut: RISC8BITPROCESSOR PORT MAP (
          clk => clk,
          reset => reset,
          pc_out => pc_out,
			 register1_out => register1_out,
			 register2_out => register2_out,
          alu_result => alu_result,
			 instruction_out => instruction_out,
			 mem_read_out => mem_read_out,
			 mem_write_en_out => mem_write_en_out,
			 reg_write_li_out => reg_write_li_out,
			 reg_write_en_out => reg_write_en_out,
			 immediate_en_out => immediate_en_out,
			 immediate_en_gate_out => immediate_en_gate_out,
			 branch_out => branch_out,
			 zero_flag_out => zero_flag_out, 
			 jump_out => jump_out,
			 and_branch_alu_out => and_branch_alu_out
        );

   -- Clock process definitions
	clk_process : process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;
		-- Stimulus process
	stim_proc: process
	begin  
		reset <= '1';
		wait for clk_period*10;
		reset <= '0';
		-- insert stimulus here 
		wait;
	end process;

end;