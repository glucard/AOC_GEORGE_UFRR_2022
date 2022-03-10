library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity CONTROL_UNIT_VHDL is
	port(
		opcode : in std_logic_vector(2 downto 0);
		reset: in std_logic;
		ALU_op : out std_logic_vector(2 downto 0);
		mem_read, mem_write_en, reg_write_li : out std_logic;
		reg_write_en, immediate_en : out std_logic;
		branch, jump : out std_logic;
		ALU_src : out std_logic
		
	);
end CONTROL_UNIT_VHDL;

architecture Behavioral of CONTROL_UNIT_VHDL is

	begin process(reset, opcode)
		
		begin if(reset = '1') then
			ALU_op <= opcode;
			jump <= '0';
			mem_read <= '0';
			mem_write_en <= '0';
			reg_write_li  <= '0';
			reg_write_en <= '0';
			branch <= '0';
			ALU_src <= '0';
			immediate_en <= '0';
		else 
			case opcode is
				when "000" => -- add, sub
					ALU_op <= opcode;
					jump <= '0';
					mem_read <= '0';
					mem_write_en <= '0';
					reg_write_li  <= '0';
					reg_write_en <= '1';
					branch <= '0';
					ALU_src <= '0';
					immediate_en <= '0';
					
				when "001" => -- jump
					ALU_op <= opcode;
					jump <= '1';
					mem_read <= '0';
					mem_write_en <= '0';
					reg_write_li  <= '0';
					reg_write_en <= '0';
					branch <= '0';
					ALU_src <= '0';
					immediate_en <= '0';
					
				when "010" => -- and
					ALU_op <= opcode;
					jump <= '0';
					mem_read <= '0';
					mem_write_en <= '0';
					reg_write_li  <= '0';
					reg_write_en <= '0';
					branch <= '1';
					ALU_src <= '0';
					immediate_en <= '0';
					
				when "011" => -- beq
					ALU_op <= opcode;
					jump <= '0';
					mem_read <= '0';
					mem_write_en <= '0';
					reg_write_li  <= '0';
					reg_write_en <= '0';
					branch <= '1';
					ALU_src <= '0';
					immediate_en <= '0';
					
				when "100" =>  -- slt
					ALU_op <= opcode;
					jump <= '0';
					mem_read <= '0';
					mem_write_en <= '0';
					reg_write_li  <= '0';
					reg_write_en <= '0';
					branch <= '1';
					ALU_src <= '0';
					immediate_en <= '0';
					
				when "101" => -- lw
					ALU_op <= opcode;
					jump <= '0';
					mem_read <= '1';
					mem_write_en <= '0';
					reg_write_li  <= '0';
					reg_write_en <= '1';
					branch <= '0';
					ALU_src <= '0';
					immediate_en <= '1';
					
				when "110" => -- sw
					ALU_op <= opcode;
					jump <= '0';
					mem_read <= '0';
					mem_write_en <= '1';
					reg_write_li  <= '0';
					reg_write_en <= '0';
					branch <= '0';
					ALU_src <= '0';
					immediate_en <= '1';
					
				when "111" => -- li
					ALU_op <= opcode;
					jump <= '0';
					mem_read <= '0';
					mem_write_en <= '0';
					reg_write_li  <= '1';
					reg_write_en <= '0';
					branch <= '0';
					ALU_src <= '0';
					immediate_en <= '0';
				
				when others =>
					ALU_op <= opcode;
					jump <= '0';
					mem_read <= '0';
					mem_write_en <= '0';
					reg_write_li  <= '0';
					reg_write_en <= '0';
					branch <= '0';
					ALU_src <= '0';
					immediate_en <= '0';
			end case;
		end if;
	end process;
end Behavioral;