library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity cache_tb is
end cache_tb;

architecture TB_ARCHITECTURE of cache_tb is
	-- Component declaration of the tested unit
	component cache
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		Address : in STD_LOGIC_VECTOR(7 downto 0);
		DataIn : in STD_LOGIC_VECTOR(15 downto 0);
		DataOut : out STD_LOGIC_VECTOR(15 downto 0);
		hit : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '0';
	signal rst : STD_LOGIC := '0';
	signal Address : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal DataIn : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	-- Observed signals - signals mapped to the output ports of tested entity
	signal DataOut : STD_LOGIC_VECTOR(15 downto 0);
	signal hit : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : cache
		port map (
			clk => clk,
			rst => rst,
			Address => Address,
			DataIn => DataIn,
			DataOut => DataOut,
			hit => hit
		);

	-- Add your stimulus here ...
	
	 clk <= not clk after 10 ns;
	
	process
	begin 
		rst <= '1';
		wait until rising_edge(clk);
        rst <= '0';     
        wait until rising_edge(clk); 
		
		
    
    	--write
    	Address <= x"55";
        DataIn   <= x"FFFF";
        wait for 30 ns;
    
    	--read     
    	Address <= x"55";
        DataIn   <= (others=>'0');
        wait for 30 ns;
		
    	wait;

		
		
		
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_cache of cache_tb is
	for TB_ARCHITECTURE
		for UUT : cache
			use entity work.cache(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_cache;

