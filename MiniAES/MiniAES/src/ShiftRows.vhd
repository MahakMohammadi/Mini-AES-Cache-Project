library ieee;

use ieee.std_logic_1164.all; 

use ieee.numeric_std.all; 

use ieee.std_logic_unsigned.all;

entity ShiftRows is	 
	
	port( input: in std_logic_vector(15 downto 0);
	
		  encrypt: in std_logic;
	
		  output: out std_logic_vector(15 downto 0)
	);
	
end ShiftRows;



architecture ShiftRows of ShiftRows is
begin 
	
	process(input, encrypt)
	begin
		
		if encrypt = '1' then
	
			-- shifting left
			output <= (input(12) & input(15 downto 13)) & (input(9 downto 8) & input(11 downto 10)) & (input(6 downto 4) & input(7)) & (input(3 downto 0));	
			
		else
			
			 -- shifting right
			output <= (input(14 downto 12) & input(15)) & (input(9 downto 8) & input(11 downto 10)) & (input(4) & input(7 downto 5)) & (input(3 downto 0));	
		  
		end if;
		
	end process;

end ShiftRows;
