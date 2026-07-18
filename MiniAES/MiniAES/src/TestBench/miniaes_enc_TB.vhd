library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity miniaes_enc_tb is
end miniaes_enc_tb;

architecture TB_ARCHITECTURE of miniaes_enc_tb is
	-- Component declaration of the tested unit
	component miniaes_enc
	port(
		data_plain : in STD_LOGIC_VECTOR(15 downto 0);
		data_enc : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal data_plain : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal data_enc : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : miniaes_enc
		port map (
			data_plain => data_plain,
			data_enc => data_enc
		);

	-- Add your stimulus here ...
	
	process
	begin 
		
		data_plain <= x"FFFF";
		wait for 30 ns;
		data_plain <= x"0390";
		wait;
		
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_miniaes_enc of miniaes_enc_tb is
	for TB_ARCHITECTURE
		for UUT : miniaes_enc
			use entity work.miniaes_enc(miniaes_enc);
		end for;
	end for;
end TESTBENCH_FOR_miniaes_enc;

