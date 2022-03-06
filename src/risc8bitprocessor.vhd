library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity RISC8BITPROCESSOR is
	port(
		clk, reset : in std_logic;
		pc_out, alu_result : out std_logic_vector(7 downto 0)
	);
end RISC8BITPROCESSOR;

architecture Behavioral of RISC8BITPROCESSOR is
	signal pc_current, pc2, pc_next : std_logic_vector(7 downto 0);
	signal instruction :std_logic_vector(7 downto 0);
	
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
	
	
	pc_next <= pc2;
	pc_out <= pc_current;
	alu_result <= instruction;
	
end Behavioral;