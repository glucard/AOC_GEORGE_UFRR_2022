library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;

entity ALU is
	port(
		a: in std_logic_vector(7 downto 0);
		b: in std_logic_vector(7 downto 0);
		alu_control: in std_logic_vector(2 downto 0);
		
		alu_result: out std_logic_vector(7 downto 0);
		zero_flag: out std_logic
	);
end ALU;

architecture Behavioral of ALU is
	signal result: std_logic_vector(7 downto 0);
	begin process(a, b, alu_control)
		begin case alu_control is
			when "000" =>
				result <= a+b; -- add
				
			when "001" =>
				result <= a-b; -- sub
				
			when "010" =>
				result <= a and b; -- and
				
			when "011" =>
				result <= a or b; -- or
			
			when "100" =>
				if (a< b) then -- slt
					result <= x"0001";
				else
					result <= x"0000";
				end if;
				
			when "101" =>
				result <= a; -- lw
				
			when "110" =>
				result <= a; -- sw
				
			when others => result <= a + b; -- add
			
		end case;
		
	end process;
	
	zero_flag <= '1' when (result=x"0000") else '0';
	alu_result <= result;

end Behavioral;