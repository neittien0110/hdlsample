library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ROM16x8 is	
	 port(
	 	A: in STD_LOGIC_VECTOR(3 downto 0);    -- 4 bit dia chi
	 	D: out STD_LOGIC_VECTOR(7 downto 0);   -- 8 bit du lieu
	  nCE: in STD_LOGIC;					   -- Active / Standby		   
	  nOE: in STD_LOGIC						   -- Output / HiZ
	     );
end ROM16x8;

architecture behavior of ROM16x8 is	   		 
begin
	main:process (A, nCE, nOE)
	begin	
		if (not (nCE = '0')) then 
			-- Neu CE khong tich cuc thi IC roi vao trang thai standby(khong mo ta trong thiet ke nay)
			-- va dau ra o trang thai tro khang cao.
			D <= (others => 'Z');
		elsif (not (nCE = '0')) then 	   
			-- Neu CE  tich cuc, nhung tin hieu cho phep xuat du lieu ra ngoai OE khong tich cuc thi 
			-- va dau ra o trang thai tro khang cao.
			D <= (others => 'Z');
		else
			case A is 
				when "0000"	=> D <= "00001000";	   
				when "0001"	=> D <= "00010100";	  
				when "0010"	=> D <= "00100010";	  
				when "0011"	=> D <= "01000001";	  				
				when others	=> D <= (others	=> '0');
			end case;
		end if;	
	end process main;
end behavior;