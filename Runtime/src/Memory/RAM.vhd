library IEEE;
use IEEE.STD_LOGIC_1164.all;	   
use IEEE.STD_LOGIC_UNSIGNED.all;

entity RAM is	   
  generic ( ADDR_WIDTH : integer := 8;
            DATA_WIDTH : integer := 8);
   port (
   		WE : in STD_LOGIC; 	   -- Tin hieu cho phep ghi vao RAM
   		OE : in STD_LOGIC;	   -- Tin hieu cho phep doc RAM
        CLK : in std_logic;
        ADDR : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        DIN  : in std_logic_vector(DATA_WIDTH-1 downto 0);
        DOUT : out std_logic_vector(7 downto 0)
      );
end entity;


architecture ram_arch of RAM is
    -- dung mang du lieu de chua gia tri
    type ram_mem_type is array (2**ADDR_WIDTH-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal ram_mem: ram_mem_type;
begin
    -- chi ghi du lieu tai suon duong clk và WE=1
    WRITE: process (CLK)
    begin
        if rising_edge(CLK) then
            if (WE = '1') then
				ram_mem(CONV_INTEGER(ADDR)) <= DIN;
            end if;
        end if;
    end process WRITE;	
	-- chi doc du lieu khi OE = 1
	READ: process (OE)
	begin 
		if (OE = '1') then
    		DOUT <= ram_mem(CONV_INTEGER(ADDR));	
		else						 
			DOUT <= (others => 'Z');	
		end if;
	end process READ;	
end architecture;
