-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity MixColumns is  
  port(     
  
	  DataIn : in std_logic_vector(15 downto 0);
	  encrypt : in std_logic;
	  DataOut : out std_logic_vector(15 downto 0)
  
  );
end MixColumns;


architecture MixColumns of MixColumns is   

signal temp0, temp1, temp2, temp3 : unsigned(7 downto 0);

begin
  
	process(encrypt, DataIn, temp0, temp1, temp2, temp3 )
	begin
		
	  if encrypt = '1' then
		  
	    temp0 <= unsigned(DataIn(3 downto 0)) * 1;
	    temp1 <= unsigned(DataIn(7 downto 4)) * 1;
	    temp2 <= unsigned(DataIn(11 downto 8)) * 1;
	    temp3 <= unsigned(DataIn(15 downto 12)) * 1;
	
	    DataOut(3 downto 0) <= std_logic_vector(temp0(3 downto 0));
	    DataOut(7 downto 4) <= std_logic_vector(temp1(3 downto 0));
	    DataOut(11 downto 8) <= std_logic_vector(temp2(3 downto 0));
	    DataOut(15 downto 12) <= std_logic_vector(temp3(3 downto 0));
	
	    
	  else	  
		  
	    temp0 <= unsigned(DataIn(3 downto 0)) * 1;
	    temp1 <= unsigned(DataIn(7 downto 4)) * 1;
	    temp2 <= unsigned(DataIn(11 downto 8)) * 1;
	    temp3 <= unsigned(DataIn(15 downto 12)) * 1;
	    
	    DataOut(3 downto 0) <= std_logic_vector(temp0(3 downto 0));
	    DataOut(7 downto 4) <= std_logic_vector(temp1(3 downto 0));
	    DataOut(11 downto 8) <= std_logic_vector(temp2(3 downto 0));  
	    DataOut(15 downto 12) <= std_logic_vector(temp3(3 downto 0));
	    
	  end if;
	  
	end process;

end MixColumns;
