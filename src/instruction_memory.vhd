library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;  

entity INSTRUCTION_MEMORY is
	port(
		pc : in std_logic_vector(7 downto 0);
		instruction : out std_logic_vector(7 downto 0)
	);
end INSTRUCTION_MEMORY;

architecture Behavioral of INSTRUCTION_MEMORY is
	type rom_type is array (0 to 7) of std_logic_vector(7 downto 0);
	
	constant rom_data : rom_type :=(
		"01110011",
		"01110101",
		"00000001",
		"00000000",
		"00000000",
		"00000000",
		"00000000",
		"00000000"
	);
begin
	instruction <= rom_data(to_integer(unsigned(pc)));

end Behavioral;