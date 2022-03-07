library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity REGISTER_FILE_VHDL is
	port(
		clk,rst: in std_logic;
		reg_write_en: in std_logic;
		reg_write_dest: in std_logic_vector(1 downto 0);
		reg_write_data: in std_logic_vector(7 downto 0);
		reg_write_li: in std_logic;
		reg_write_data_li: in std_logic_vector(7 downto 0);
		reg_read_addr_1: in std_logic_vector(1 downto 0);
		reg_read_data_1: out std_logic_vector(7 downto 0);
		reg_read_addr_2: in std_logic_vector(1 downto 0);
		reg_read_data_2: out std_logic_vector(7 downto 0)
	);
end REGISTER_FILE_VHDL;

architecture Behavioral of REGISTER_FILE_VHDL is
	type reg_type is array (0 to 3 ) of std_logic_vector (7 downto 0);
	signal reg_array: reg_type;
	
	begin process(clk, rst)
		begin if (rst = '1') then
			reg_array(0) <= "00000000";
			reg_array(1) <= "00000000";
			reg_array(2) <= "00000000";
			reg_array(3) <= "00000000";
		elsif (rising_edge(clk)) then
			if (reg_write_en = '1') then
				reg_array(to_integer(unsigned(reg_write_dest))) <= reg_write_data;
			elsif (reg_write_li = '1') then
				reg_array(to_integer(unsigned(reg_write_dest))) <= reg_write_data_li;
			end if;
		end if;
	end process;
	
	reg_read_data_1 <= reg_array(to_integer(unsigned(reg_read_addr_1)));
	reg_read_data_2 <= reg_array(to_integer(unsigned(reg_read_addr_2)));
	
end Behavioral;