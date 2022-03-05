library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;

entity ALU is
	port(
		a: in std_logic_vector(7 downto 0);
		b: in std_logic_vector(7 downto 0);
		alu_control: in std_logic_vector(3 downto 0);
		
		alu_result: out std_logic_vector(7 downto 0);
		zero_flag: out std_logic
	);
end ALU;

architecture Behavioral of ALU is
	signal result: std_logic_vector(7 downto 0);
	begin process(a, b, alu_control)
		begin case alu_control is
			when "0000" =>
				result <= a+b; -- add
				
			when "0001" =>
				result <= a-b; -- sub
				
			when "0010" =>
				result <= a and b; -- and
				
			when "0011" =>
				result <= a or b; -- or
			
			when "0100" =>
				if (a< b) then -- slt
					result <= x"0001";
				else
					result <= x"0000";
				end if;
				
			when "0101" =>
				result <= a; -- lw
				
			when "0110" =>
				result <= a; -- sw
				
			when "0111" =>
				result <= a; -- li
				
			when others => result <= a + b; -- add
			
		end case;
		
	end process;
	
	zero_flag <= '1' when (result=x"0000") else '0';
	alu_result <= result;

end Behavioral;