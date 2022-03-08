library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity JUMP_MUX_VHDL is
	port(
		jump : in std_logic;
		pc_jump : in std_logic_vector(7 downto 0);
		pc2 : in std_logic_vector(7 downto 0);
		pc_out : out std_logic_vector(7 downto 0)
	);
end JUMP_MUX_VHDL;

architecture Behavioral of JUMP_MUX_VHDL is

begin
	pc_out <= pc_jump when (jump = '1') else pc2;

end Behavioral;