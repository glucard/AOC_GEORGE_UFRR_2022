library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;

entity ALU_VHDL is
	port(
		a: in std_logic_vector(7 downto 0);
		b: in std_logic_vector(7 downto 0);
		alu_op: in std_logic_vector(3 downto 0);
		
		alu_result: out std_logic_vector(7 downto 0);
		zero_flag: out std_logic
	);
end ALU_VHDL;

architecture Behavioral of ALU_VHDL is
	signal result: std_logic_vector(7 downto 0);
	begin process(a, b, alu_op)
		begin case alu_op is
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
					result <= "00000001";
				else
					result <= "00000000";
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
	
	zero_flag <= '1' when (result="00000000") else '0';
	alu_result <= result;

end Behavioral;