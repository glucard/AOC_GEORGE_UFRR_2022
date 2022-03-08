library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity ALU_CONTROL_VHDL is
	port(
		ALU_op : in std_logic_vector(2 downto 0);
		ALU_Funct : in std_logic;
		ALU_CONTROL: out std_logic_vector(3 downto 0)
	);
end ALU_CONTROL_VHDL;

architecture Behavioral of ALU_CONTROL_VHDL is
	begin process(ALU_op,ALU_Funct)
		begin case ALU_op is
			when "000" => -- add, sub
				if(ALU_Funct = '0') then
					ALU_CONTROL <= "0000";
				else
					ALU_CONTROL <= "0001";
				end if;
			when "001" =>
				ALU_CONTROL <= "1000"; -- jump
			
			when "010" =>
				ALU_CONTROL <= "0" & ALU_op; -- and
				
			when "011" =>
				ALU_CONTROL <= "0" & ALU_op; -- beq
			
			when "100" =>
				ALU_CONTROL <= "0" & ALU_op; -- slt
				
			when "101" =>
				ALU_CONTROL <= "0" & ALU_op; -- lw
				
			when "110" =>
				ALU_CONTROL <= "0" & ALU_op; -- sw
				
			when "111" =>
				ALU_CONTROL <= "0" & ALU_op; -- li
				
			when others => -- add, sub
				if(ALU_Funct = '0') then
					ALU_CONTROL <= "0000";
				else
					ALU_CONTROL <= "0001";
				end if;
				
		end case;
	end process;
end Behavioral;