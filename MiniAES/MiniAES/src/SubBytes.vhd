library ieee;

use ieee.std_logic_1164.all; 

use ieee.numeric_std.all; 

use ieee.std_logic_unsigned.all;



entity SubBytes is
	
	port(input: in std_logic_vector(15 downto 0);
		encrypt: in std_logic;
		output: out std_logic_vector(15 downto 0)
	);
	
end SubBytes;



architecture SubBytes of SubBytes is 

	signal temp: std_logic_vector(15 downto 0):= (others => '0');

begin
	
	process(input, encrypt)
	
	variable step : integer;
	
	variable temporary_input: std_logic_vector(3 downto 0):= input(3 downto 0);
	begin 
		
		if encrypt = '1' then
			
			for i in 0 to 3 loop
				
				step:= i * 4;
				
				temporary_input := 	input(step + 3 downto step);
				
				case temporary_input  is
					
					when "0000" => temp(step + 3 downto step) <= "0101";	
					
					when "0001" => temp(step + 3 downto step) <= "0110";	
					
					when "0010" => temp(step + 3 downto step) <= "0111";	
					
					when "0011" => temp(step + 3 downto step) <= "1000";	
					
					when "0100" => temp(step + 3 downto step) <= "1001";	
					
					when "0101" => temp(step + 3 downto step) <= "1010";	
					
					when "0110" => temp(step + 3 downto step) <= "1011";	
					
					when "0111" => temp(step + 3 downto step) <= "1100";	
					
					when "1000" => temp(step + 3 downto step) <= "1101";	
					
					when "1001" => temp(step + 3 downto step) <= "1110";	
					
					when "1010" => temp(step + 3 downto step) <= "1111";	
					
					when "1011" => temp(step + 3 downto step) <= "0000";	
					
					when "1100" => temp(step + 3 downto step) <= "0001";	
					
					when "1101" => temp(step + 3 downto step) <= "0010";	
					
					when "1110" => temp(step + 3 downto step) <= "0011";	
					
					when others => temp(step + 3 downto step) <= "0100";	
					
				end case;
				
			end loop;
			
		else
			
			for i in 0 to 3 loop
				
				step:= i * 4;
				
				temporary_input := input(step + 3 downto step);
				
				case temporary_input  is
					
					when "0000" => temp(step + 3 downto step) <= "1011";	
					
					when "0001" => temp(step + 3 downto step) <= "1100";	
					
					when "0010" => temp(step + 3 downto step) <= "1101";	
					
					when "0011" => temp(step + 3 downto step) <= "1110";	
					
					when "0100" => temp(step + 3 downto step) <= "1111";	
					
					when "0101" => temp(step + 3 downto step) <= "0000";	
					
					when "0110" => temp(step + 3 downto step) <= "0001";	
					
					when "0111" => temp(step + 3 downto step) <= "0010";	
					
					when "1000" => temp(step + 3 downto step) <= "0011";	
					
					when "1001" => temp(step + 3 downto step) <= "0100";	
					
					when "1010" => temp(step + 3 downto step) <= "0101";	
					
					when "1011" => temp(step + 3 downto step) <= "0110";	
					
					when "1100" => temp(step + 3 downto step) <= "0111";	
					
					when "1101" => temp(step + 3 downto step) <= "1000";	
					
					when "1110" => temp(step + 3 downto step) <= "1001";	
					
					when others => temp(step + 3 downto step) <= "1010";	
					
				end case;
				
			end loop;
			
		end if;
		
	end process;
	
	output <= temp;
	

end SubBytes;
