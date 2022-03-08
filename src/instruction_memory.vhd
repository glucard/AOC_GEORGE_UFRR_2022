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
	type rom_type is array (0 to 29) of std_logic_vector(7 downto 0);
	
	constant rom_data : rom_type :=(
		"11100111", --  li $0  7  UNTIL
		"00000000", -- add $0 $0  THE BIGGER THE BEST
		"00000000", -- add $0 $0  THE BIGGER THE BEST
		"00000000", -- add $0 $0  THE BIGGER THE BEST
		"00000000", -- add $0 $0  THE BIGGER THE BEST
		"11101011", --  li $1  3
		"11000010", --  sw $0 $1
		"11101001", --  li $1  1
		"11110000", --  li $2  0
		"11111101", --  li $3  5
		"11001100", --  sw $1 $2
		
		"11100000", --  li $0  0
		"10100000", --  lw $0 $0
		"11001000", --  sw $1 $0
		"11001110", --  sw $1 $3
		"11101000", --  li $1  0
		"10101010", --  lw $1 $1
		"00011000", -- add $3 $0
		"11101001", --  li $1  1
		"10101010", --  lw $1 $1
		"00001100", -- add $1 $2
		"11110001", --  li $2  1
		"10110100", --  lw $2 $2
		"11100011", --  li $0  3
		"10100000", --  lw $0 $0
		"10001000", -- slt $1 $0
		"00101011", --   j 12
		
		"11100000",
		"11101101",
		"11000010"
	);
begin
	instruction <= rom_data(to_integer(unsigned(pc)));

end Behavioral;


--!	constant rom_data : rom_type :=(
--!		"11100111", --  li $0  7  UNTIL
--!		"11101001", --  li $1  1  SUM
--!		"11110001", --  li $2  0  ADDRESS
--!		"11111001", --  li $3  1	SUM_ADDRESS
--!		
--!		"11001100", --  sw $1 $2
--!		
--!		"00001010", -- add $1 $1
--!		"00010110", -- add $1 $1
--!		"11001100", --  sw $1 $2
--!		"10001000", -- slt $1 $0 -- 0
--!		"00100101"  --   j 5
--!	);