library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity PC_ADD_VHDL is
	port(
		pc_current : in std_logic_vector(7 downto 0);
		pc2: out std_logic_vector(7 downto 0)
	);
end PC_ADD_VHDL;

architecture Behavioral of PC_ADD_VHDL is
	
begin
	pc2 <= pc_current + 1;

end Behavioral;