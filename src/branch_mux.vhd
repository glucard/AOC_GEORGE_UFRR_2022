library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity BRANCH_MUX_VHDL is
	port(
		en : in std_logic;
		-- offset : in std_logic;
		pc_next : in std_logic_vector(7 downto 0);
		pc_out : out std_logic_vector(7 downto 0)
	);
end BRANCH_MUX_VHDL;

architecture Behavioral of BRANCH_MUX_VHDL is

begin
	pc_out <= pc_next + 1 when (en = '1') else pc_next;

end Behavioral;