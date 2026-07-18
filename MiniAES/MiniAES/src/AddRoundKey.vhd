library ieee;

use ieee.std_logic_1164.all; 

use ieee.numeric_std.all; 

use ieee.std_logic_unsigned.all;

entity AddRoundKey is 
	
	port(key, input: in std_logic_vector(15 downto 0);
	
		output: out  std_logic_vector(15 downto 0)
	
	);
	
end AddRoundKey;



architecture AddRoundKey of AddRoundKey is
begin

	 output <= key xor input;

end AddRoundKey;
