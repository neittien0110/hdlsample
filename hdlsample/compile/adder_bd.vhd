-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hdlsample
-- Author      : Nguyen Duc Tien
-- Company     : Home
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\hdlsample\hdlsample\compile\Adder_BD.vhd
-- Generated   : Sun Sep 27 10:16:33 2015
-- From        : c:\My_Designs\hdlsample\hdlsample\src\Adder\Adder_BD.bde
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


entity Adder_BD is
  port(
       Ci : in STD_LOGIC;
       A : in STD_LOGIC_VECTOR(3 downto 0);
       B : in STD_LOGIC_VECTOR(3 downto 0);
       Co : out STD_LOGIC;
       S : out STD_LOGIC_VECTOR(3 downto 0)
  );
end Adder_BD;

architecture Adder_BD of Adder_BD is

---- Component declarations -----

component FullAdder
  port (
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       Ci : in STD_LOGIC;
       Co : out STD_LOGIC;
       S : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET1 : STD_LOGIC;
signal NET2 : STD_LOGIC;
signal NET3 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : FullAdder
  port map(
       A => A(0),
       B => B(0),
       Ci => Ci,
       Co => NET1,
       S => S(0)
  );

U2 : FullAdder
  port map(
       A => A(1),
       B => B(1),
       Ci => NET1,
       Co => NET2,
       S => S(1)
  );

U3 : FullAdder
  port map(
       A => A(2),
       B => B(2),
       Ci => NET2,
       Co => NET3,
       S => S(2)
  );

U4 : FullAdder
  port map(
       A => A(3),
       B => B(3),
       Ci => NET3,
       Co => Co,
       S => S(3)
  );


end Adder_BD;
