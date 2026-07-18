library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

use ieee.std_logic_unsigned.all;

entity MiniAES_Enc is 
	
	port(data_plain: in std_logic_vector(15 downto 0);
	
		data_enc: out std_logic_vector(15 downto 0)
	
	);
	
end MiniAES_Enc;



architecture MiniAES_Enc of MiniAES_Enc is 

	signal output_SubByte1, output_SubByte2, output_ShiftRows1, output_ShiftRows2, output_MixColumns1, output_AddRoundKey1,	output_AddRoundKey2: std_logic_vector(15 downto 0);


begin

		
	-- First Round of encrypting 
	
	SubBytes_1: entity work.SubBytes
		
		Port map( 
		
				input => data_plain,
				
				encrypt => '1',
				
				output =>  output_SubByte1
		); 
		
	ShiftRows_1: entity work.ShiftRows
		
		Port map(
		
				input => output_SubByte1,
				
				encrypt => '1',
				
				output =>  output_ShiftRows1
		);
		
	MixColumns_1: entity work.MixColumns
		
		Port map(
		
				DataIn => output_ShiftRows1,
				
				encrypt => '1',
				
				DataOut =>  output_MixColumns1
		);
		
	AddRoundKey_1: entity work.AddRoundKey
		
		Port map(
		
				input => output_MixColumns1,
				
				key => x"ABCD",
				
				output =>  output_AddRoundKey1
		);
		
	-- Final Round of encrypting 
	
	SubBytes_2: entity work.SubBytes
		
		Port map( 
		
				input => output_AddRoundKey1,
				
				encrypt => '1',
				
				output =>  output_SubByte2
		); 
		
	ShiftRows_2: entity work.ShiftRows
		
		Port map(
		
				input => output_SubByte2,
				
				encrypt => '1',
				
				output =>  output_ShiftRows2
		);
		
	AddRoundKey_2: entity work.AddRoundKey
		
		Port map(
		
				input => output_ShiftRows2,
				
				key => x"ABCD",
				
				output =>  output_AddRoundKey2
		);
		
		
	data_enc <= output_AddRoundKey2;
							

end MiniAES_Enc;
