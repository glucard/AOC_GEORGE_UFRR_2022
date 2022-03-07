library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity ALU_CONTROL_VHDL is
	port(
		opcode : in std_logic_vector(3 downto 0);
		ALU_op : out std_logic_vector(3 downto 0);
		mem_read : out std_logic;
		mem_write_en : out std_logic;
		reg_write : out std_logic;
		branch : out std_logic
	);
end ALU_CONTROL_VHDL;

architecture Behavioral of ALU_CONTROL_VHDL is

	begin process(opcode)
		
		begin case opcode is
			when "0000" => -- add
				ALU_op <= opcode;
				mem_read <= '0';
				mem_write_en <= '0';
				reg_write <= '1';
				branch <= '0';
				
			when "0001" => -- sub
				ALU_op <= opcode;
				mem_read <= '0';
				mem_write_en <= '0';
				reg_write <= '1';
				branch <= '0';
				
			when "0010" => -- and
				ALU_op <= opcode;
				mem_read <= '0';
				mem_write_en <= '0';
				reg_write <= '0';
				branch <= '1';
				
			when "0011" => -- or
				ALU_op <= opcode;
				mem_read <= '0';
				mem_write_en <= '0';
				reg_write <= '0';
				branch <= '1';
				
			when "0100" =>  -- slt
				ALU_op <= opcode;
				mem_read <= '0';
				mem_write_en <= '0';
				reg_write <= '0';
				branch <= '1';
				
			when "0101" => -- lw
				ALU_op <= opcode;
				mem_read <= '1';
				mem_write_en <= '0';
				reg_write <= '1';
				branch <= '0';
				
			when "0110" => -- sw
				ALU_op <= opcode;
				mem_read <= '0';
				mem_write_en <= '1';
				reg_write <= '0';
				branch <= '0';
				
			when "0111" => -- li
				ALU_op <= opcode;
				mem_read <= '0';
				mem_write_en <= '0';
				reg_write <= '1';
				branch <= '0';
			
			when others =>
				ALU_op <= opcode;
				mem_read <= '0';
				mem_write_en <= '0';
				reg_write <= '0';
				branch <= '0';
			
		end case;
	end process;
end Behavioral;