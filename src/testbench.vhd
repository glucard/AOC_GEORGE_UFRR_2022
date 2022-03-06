LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity testbench is 
end testbench;

architecture behavior of testbench is
	component RISC8BITPROCESSOR port(
		clk : in std_logic;
		reset : in std_logic;
		pc_out : out std_logic_vector(7 downto 0);
		alu_result : out std_logic_vector(7 downto 0)
	);
	end component;
	
	signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   --Outputs
   signal pc_out : std_logic_vector(7 downto 0);
   signal alu_result : std_logic_vector(7 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
BEGIN
 -- Instantiate the for the single-cycle MIPS Processor in VHDL
   uut: RISC8BITPROCESSOR PORT MAP (
          clk => clk,
          reset => reset,
          pc_out => pc_out,
          alu_result => alu_result
        );

   -- Clock process definitions
	clk_process : process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;
		-- Stimulus process
	stim_proc: process
	begin  
		reset <= '1';
		wait for clk_period*10;
		reset <= '0';
		-- insert stimulus here 
		wait;
	end process;

end;