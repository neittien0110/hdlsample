-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hdlsample
-- Author      : Nguyen Duc Tien
-- Company     : Home
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\hdlsample\hdlsample\compile\FullAdder.vhd
-- Generated   : Sun Sep 27 10:16:36 2015
-- From        : c:\My_Designs\hdlsample\hdlsample\src\Adder\FullAdder.bde
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


entity FullAdder is
  port(
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       Ci : in STD_LOGIC;
       Co : out STD_LOGIC;
       S : out STD_LOGIC
  );
end FullAdder;

architecture FullAdder of FullAdder is

---- Component declarations -----

component HalfAdder
  port (
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       C : out STD_LOGIC;
       S : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET1 : STD_LOGIC;
signal NET2 : STD_LOGIC;
signal NET3 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : HalfAdder
  port map(
       A => A,
       B => B,
       C => NET3,
       S => NET1
  );

U2 : HalfAdder
  port map(
       A => NET1,
       B => Ci,
       C => NET2,
       S => S
  );

Co <= NET2 or NET3;


end FullAdder;
