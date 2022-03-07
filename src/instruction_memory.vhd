library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;  

entity INSTRUCTION_MEMORY_VHDL is
	port(
		pc : in std_logic_vector(7 downto 0);
		instruction : out std_logic_vector(7 downto 0)
	);
end INSTRUCTION_MEMORY_VHDL;

architecture Behavioral of INSTRUCTION_MEMORY_VHDL is
	type rom_type is array (0 to 4) of std_logic_vector(7 downto 0);
	
	constant rom_data : rom_type :=(
		"11100111", -- li $0 7
		"11101010", -- li $1 2
		"00010000", -- add $2 $0
		"00010011",--, -- sub $2 $1
		"11010110" -- sw $2 $3
	);
begin
	instruction <= rom_data(to_integer(unsigned(pc)));

end Behavioral;