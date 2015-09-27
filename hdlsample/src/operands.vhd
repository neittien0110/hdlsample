-------------------------------------------------------------------------------
--
-- Title       : runtime1
-- Design      : Runtime
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : runtime1.vhd
-- Generated   : Tue Nov 12 15:05:13 2013
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;						 -- Su dung thu vien chuan	
use IEEE.std_logic_1164.all;		 -- Su dung cac phan tu logic
use IEEE.std_logic_signed.all;		 -- Khai bao goi std_logic_signed de co phep + - * abs tren tin hieu
use IEEE.std_logic_arith.all;		 -- Khai bao goi std_logic_arith de co ham chuyen doi INTEGER-->STD_LOGIC_VECTOR

entity OPERANDS is
	generic
	(	
	    --! @brief	Do rong cua cac toan hang. Don vi bit.
		BUS_WIDTH: integer := 8
	);
	port
	(
		Av : in std_logic_vector(BUS_WIDTH-1 downto 0);   --! @brief	Toan hang vao thu nhat cua phep nhan
		Bv : in std_logic_vector(BUS_WIDTH-1 downto 0);   --! @brief	Toan hang vao thu hai cua phep nhan
		Cv : out std_logic_vector(BUS_WIDTH-1 downto 0) --! @brief	Toan hang ra, ket qua cua phep nhan
     );
end entity OPERANDS;

architecture behavior of OPERANDS is	 
signal  MERGER : STD_LOGIC_VECTOR( BUS_WIDTH * 2 -1 downto 0);
begin	
	-- Phep ghep noi tin hieu
	-- Gia su BUS_WIDTH=2 thi MERGE[3,2,1,0] <= [Av(1), Av(0), Bv(1), Bv(0)] 
	MERGER <= Av & Bv ;
	-- Phep cong 
    Cv <= Av + Bv;
	-- Phep tru 
	Cv <= Av - Bv;
	-- Phep nhan 
	Cv <= Av * Bv;
	-- Phep mu, khong ton tai. Phai chuyen doi thanh kieu integer va tinh toan trong PROCESS
	--Cv <= Av ** Bv;
	-- Lay tri tuyet doi, chi co o goi STD_LOGIC_SIGNED, khong co trong goi STD_LOGIC_UNSIGNED		
	Cv <= abs(Av); 	
	-- Phep gan gia tri cho da tin hieu tu so integer, voi do rong bus 
	-- chi co trong goi STD_LOGIC_ARITH
	Cv <= CONV_STD_LOGIC_VECTOR(7,BUS_WIDTH);
	
	process (Av, Bv)	
	variable  varA, varB, varC: integer;
    begin
		varA := CONV_INTEGER(Av);	      -- Chuyen doi tu kieu STD_LOGIC_VECTOR --> integer
		varB := CONV_INTEGER(Bv);		  -- de tien loi tinh toan
		varC := varA + varA ** varB + varA mod 3 - varA rem varB;  -- Thuc hien tinh toan phuc tap
		Cv <= CONV_STD_LOGIC_VECTOR(7,BUS_WIDTH);  -- Chuyen doi ket qua integer --> STD_LOGIC_VECTOR
	end process;	
end behavior;
