library IEEE;								-- Su dung thu vien chuan	  
use IEEE.std_logic_1164.all;				-- Su dung cac phan tu logic

-- @brief 		Chon kenh 2x1
-- @details		Khong co tin hieu CE
--
 
entity MUX2x1 is
	port (
		I1  : in std_logic;		--! Kenh vao I0
		I0  : in std_logic;		--! Kenh vao I1
		SEL : in std_logic;		--! Tin hieu chon kenh 
		O   : out std_logic		--! Kenh dau ra
		);
end entity MUX2x1;
 
architecture behavior of MUX2x1 is	   
begin
	process (I0, I1, SEL)				  		-- Process chi duoc goi ra de thuc thi, khi co su thay doi tren tin hieu I0, I1, và SEL	
	variable  x: integer  ;
	begin
		if SEL = '1' then			      		-- Neu chon kenh 1
			O <= I1;
		else				    	  			-- Neu chon kenh 0
			O <= I0;
		end if;
	end process;
end behavior;	   


architecture dataflow of MUX2x1 is	   
begin
	O <= (I1 and SEL)  or (I0 and (not SEL));
end dataflow;
