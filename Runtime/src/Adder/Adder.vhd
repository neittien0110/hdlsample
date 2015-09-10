-------------------------------------------------------------------------------
--
-- Title       : Adder
-- Design      : IT4251Collection
-- Author      : Nguyen Duc Tien
-- Company     : Home
--
-------------------------------------------------------------------------------
--
-- File        : Adder.vhd
-- Generated   : Sun Sep  6 19:41:20 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Adder} architecture {Adder}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;			-- Thu vien de co phep + tren kieu STD_LOGIC_VECTOR khong dau

entity Adder is	   
	generic	( BUS_WIDTH : integer := 8);	
    port(
		 Ci : in STD_LOGIC;
		 A : in STD_LOGIC_VECTOR(BUS_WIDTH-1 downto 0);
		 B : in STD_LOGIC_VECTOR(BUS_WIDTH-1 downto 0);
		 S : out STD_LOGIC_VECTOR(BUS_WIDTH-1 downto 0);
		 Co : out STD_LOGIC
	     );
end Adder;

--Nguyen ly: Phep cong 2 so n bit se duoc ket qua la 1 so n+1 bit
--        Ci		        Ci
--         A			   0 A
--	 +     B			+  0 B 
--	   ------    <-->	------
--	 Co    S			  Co S
--
architecture MyDataflow of Adder is	   			 
signal Aex: STD_LOGIC_VECTOR(BUS_WIDTH downto 0);	-- Mo rong toan hang A them 1 bit
signal Bex: STD_LOGIC_VECTOR(BUS_WIDTH downto 0);	-- Mo rong toan hang B them 1 bit
signal Sex: STD_LOGIC_VECTOR(BUS_WIDTH downto 0);	-- Mo rong ket qua phep cong them 1 bit
begin
	Aex <= '0' & A ;
	Bex <= '0' & B;
	Sex <= Aex + Bex ; 
	Co  <= Sex(BUS_WIDTH);
end MyDataflow;
