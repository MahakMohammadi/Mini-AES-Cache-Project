library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

use ieee.std_logic_unsigned.all;

entity MiniAES_Dec is
	
	port(data_enc: in std_logic_vector(15 downto 0);
		  
		data_plain: out std_logic_vector(15 downto 0)
	
	);
	
end MiniAES_Dec;



architecture MiniAES_Dec of MiniAES_Dec is

	signal output_SubByte1, output_SubByte2, output_ShiftRows1, output_ShiftRows2, output_MixColumns1, output_AddRoundKey1,	output_AddRoundKey2: std_logic_vector(15 downto 0);

begin

	-- First Round of decrypting 
	
	AddRoundKey_1: entity work.AddRoundKey
		
		Port map(
		
				input => data_enc,
				
				key => x"ABCD",
				
				output =>  output_AddRoundKey1
		);
		
	ShiftRows_1: entity work.ShiftRows
	
	Port map(
	
			input => output_AddRoundKey1,
			
			encrypt => '0',
			
			output =>  output_ShiftRows1
	);
	
	SubBytes_1: entity work.SubBytes
		
		Port map( 
		
				input => output_ShiftRows1,
				
				encrypt => '0',
				
				output =>  output_SubByte1
		); 
		

	-- Final Round of decrypting 
	
	AddRoundKey_2: entity work.AddRoundKey
		
		Port map(
		
				input => output_SubByte1,
				
				key => x"ABCD",
				
				output =>  output_AddRoundKey2
		);
		
	MixColumns_1: entity work.MixColumns
		
		Port map(
		
				DataIn => output_AddRoundKey2,
				
				encrypt => '0',
				
				DataOut =>  output_MixColumns1
		);
	 
		
	ShiftRows_2: entity work.ShiftRows
		
		Port map(
		
				input => output_MixColumns1,
				
				encrypt => '0',
				
				output =>  output_ShiftRows2
		); 
		
	SubBytes_2: entity work.SubBytes
		
		Port map( 
		
				input => output_ShiftRows2,
				
				encrypt => '0',
				
				output =>  output_SubByte2
		);
		
	
		
		
	data_plain <= output_SubByte2;

end MiniAES_Dec;
