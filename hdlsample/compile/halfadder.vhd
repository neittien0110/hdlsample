-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hdlsample
-- Author      : Nguyen Duc Tien
-- Company     : Home
--
-------------------------------------------------------------------------------
--
-- File        : W:\workspaces\activehdl\hdlsample\hdlsample\compile\halfadder.vhd
-- Generated   : Sun Sep 27 10:18:43 2015
-- From        : W:\workspaces\activehdl\hdlsample\hdlsample\src\adder\halfadder.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity HalfAdder is
  port(
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       C : out STD_LOGIC;
       S : out STD_LOGIC
  );
end HalfAdder;

architecture HalfAdder of HalfAdder is

begin

----  Component instantiations  ----

S <= B xor A;

C <= B and A;


end HalfAdder;
