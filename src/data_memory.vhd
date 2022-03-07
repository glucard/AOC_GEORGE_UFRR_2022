library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
USE IEEE.numeric_std.all;

entity DATA_MEMORY_VHDL is
	port(
		clk: in std_logic;
		mem_access_addr: in std_logic_Vector(7 downto 0);
		mem_write_data: in std_logic_Vector(7 downto 0);
		mem_write_en,mem_read:in std_logic;
		mem_read_data: out std_logic_Vector(7 downto 0)
	);
end DATA_MEMORY_VHDL;

architecture Behavioral of DATA_MEMORY_VHDL is
	-- signal i: integer;
	signal ram_addr : std_logic_vector(7 downto 0);
	type data_mem is array (0 to 255) of std_logic_vector(7 downto 0);
	signal ram : data_mem :=((others => (others => '0')));
begin
	ram_addr <= mem_access_addr;
	process(clk) begin
		if(rising_edge(clk)) then
			if(mem_write_en = '1') then
				ram(to_integer(unsigned(ram_addr))) <= mem_write_data;
			end if;
		end if;
	end process;
	mem_read_data <= ram(to_integer(unsigned(ram_addr))) when (mem_read ='1') else "00000000";
	
end Behavioral;