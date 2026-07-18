library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cache is
    Port (
        clk      : in  STD_LOGIC;
        rst      : in  STD_LOGIC;
        Address  : in  STD_LOGIC_VECTOR(7 downto 0);
        DataIn   : in  STD_LOGIC_VECTOR(15 downto 0);
        DataOut  : out STD_LOGIC_VECTOR(15 downto 0);
        hit      : out STD_LOGIC
    );
end cache;

architecture Behavioral of cache is

    -- 64 blocks ? index = 6 bits
    constant NUM_BLOCKS : integer := 16;

    -- 16 blocks of words array
    type cache_type is array (0 to NUM_BLOCKS-1) of std_logic_vector(15 downto 0);

    signal CacheMem : cache_type :=  (
	
	1 => x"44F3",
	others => (others => '0'));

    -- 16 blocks , each tag 4 bits
    type tag_array is array (0 to NUM_BLOCKS-1) of std_logic_vector(3 downto 0);
    signal TagMem : tag_array := (others => (others => '0'));

    -- address
    signal tag_addr   : std_logic_vector(3 downto 0);  -- 7 to 4
    signal index_addr : std_logic_vector(3 downto 0);  -- 3 to 0   
	
	signal data_encrypted, data_decrypted, data_read_from_cache: std_logic_vector(15 downto 0);

begin
	
	
    -- Extract address bits
    tag_addr   <= Address(7 downto 4);
    index_addr <= Address(3 downto 0);
	
	data_read_from_cache <= CacheMem(to_integer(unsigned(index_addr)));
	
	-- Encrypting 
	
	Encrypting: entity work.MiniAES_Enc
		
		Port map(
		
				data_plain => DataIn,
				
				data_enc =>  data_encrypted
		); 
		
	-- Decrypting 
	
	Decrypting: entity work.MiniAES_Dec
		
		Port map(
		
				data_enc => data_read_from_cache,
				
				data_plain =>  data_decrypted
		);

    process(clk, rst)
    begin  
		
        if rst = '1' then
			
            DataOut <= (others => '0');
			
            hit <= '0';

        elsif rising_edge(clk) then	

            if TagMem(to_integer(unsigned(index_addr))) = tag_addr then
				
				--Reading
				
                hit <= '1';
				
                DataOut <= data_decrypted;

            else
                
				--Writing
				
                hit <= '0';
				
                CacheMem(to_integer(unsigned(index_addr))) <= data_encrypted;
				
                TagMem(to_integer(unsigned(index_addr))) <= tag_addr;
				
                DataOut <= DataIn;

            end if;

        end if;
    end process;

end Behavioral;
