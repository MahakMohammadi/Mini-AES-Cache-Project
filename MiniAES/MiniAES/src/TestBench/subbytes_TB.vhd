library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity subbytes_tb is
end subbytes_tb;

architecture TB_ARCHITECTURE of subbytes_tb is
	-- Component declaration of the tested unit
	component subbytes
	port(
		input : in STD_LOGIC_VECTOR(15 downto 0);
		encrypt : in STD_LOGIC;
		output : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(15 downto 0);
	signal encrypt : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : subbytes
		port map (
			input => input,
			encrypt => encrypt,
			output => output
		);

	-- Add your stimulus here ...
	
	process
	begin
		
		encrypt <= '1';
		input <= "0000000100100011"	;
		wait for 20 ns;
		
		encrypt <= '0';
		input <= "0101011001111000"; 
		wait;
		
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_subbytes of subbytes_tb is
	for TB_ARCHITECTURE
		for UUT : subbytes
			use entity work.subbytes(subbytes);
		end for;
	end for;
end TESTBENCH_FOR_subbytes;

