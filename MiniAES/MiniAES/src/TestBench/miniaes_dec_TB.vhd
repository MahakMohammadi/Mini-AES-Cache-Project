library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity miniaes_dec_tb is
end miniaes_dec_tb;

architecture TB_ARCHITECTURE of miniaes_dec_tb is
	-- Component declaration of the tested unit
	component miniaes_dec
	port(
		data_enc : in STD_LOGIC_VECTOR(15 downto 0);
		data_plain : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal data_enc : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal data_plain : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : miniaes_dec
		port map (
			data_enc => data_enc,
			data_plain => data_plain
		);

	-- Add your stimulus here ... 
	
	process
	begin 
		
		data_enc <= x"44F3";
		wait;
		
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_miniaes_dec of miniaes_dec_tb is
	for TB_ARCHITECTURE
		for UUT : miniaes_dec
			use entity work.miniaes_dec(miniaes_dec);
		end for;
	end for;
end TESTBENCH_FOR_miniaes_dec;

