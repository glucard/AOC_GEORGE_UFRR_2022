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
	type rom_type is array (0 to 3) of std_logic_vector(7 downto 0);
	
	constant rom_data : rom_type :=(
		"01110001", -- li $0 1
		"01110101", -- li $1 1
		"00001000", -- add $2 $0
		"00001001"--, -- add $2 $1
		-- "01111111" -- li $3 3
	);
begin
	instruction <= rom_data(to_integer(unsigned(pc)));

end Behavioral;