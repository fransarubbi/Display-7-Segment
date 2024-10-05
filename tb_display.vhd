LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb_display IS
END tb_display;
 
ARCHITECTURE behavior OF tb_display IS 

    COMPONENT display
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
			show : IN  std_logic;
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
			c : IN  std_logic_vector(7 downto 0);
         d : IN  std_logic_vector(7 downto 0);
         selector : OUT  std_logic_vector(3 downto 0);
         digitos : OUT  std_logic_vector(6 downto 0);
         pd : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
	signal show : std_logic := '0';
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
	signal c : std_logic_vector(7 downto 0) := (others => '0');
   signal d : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal selector : std_logic_vector(3 downto 0);
   signal digitos : std_logic_vector(6 downto 0);
   signal pd : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display PORT MAP (
          clk => clk,
          rst => rst,
			 show => show,
          a => a,
          b => b,
			 c => c,
			 d => d,
          selector => selector,
          digitos => digitos,
          pd => pd
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '0';
		show <= '1';
		wait for 50 ns;
		
		rst <= '1';
		a <= "00011111";  -- 1 - f
		b <= "10000000";  -- 8 - 0
		wait for 8 ms;
		
		a <= "01011010";  -- 5 - a
		b <= "11100010";  -- e - 2

      wait;
   end process;

END;
