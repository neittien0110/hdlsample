-------------------------------------------------------------------------------
--
-- Title       : miniALU
-- Design      : hdlsample
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : W:\workspaces\activehdl\hdlsample\hdlsample\compile\minialu.vhd
-- Generated   : Sun Sep 27 10:30:33 2015
-- From        : W:\workspaces\activehdl\hdlsample\hdlsample\src\minialu\minialu.bde
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


entity miniALU is
  port(
       A : in STD_LOGIC_VECTOR(7 downto 0);
       B : in STD_LOGIC_VECTOR(7 downto 0);
       Sel : in STD_LOGIC_VECTOR(1 downto 0);
       O : out STD_LOGIC_VECTOR(7 downto 0)
  );
end miniALU;

architecture miniALU of miniALU is

---- Component declarations -----

component AND8
  port (
       A : in STD_LOGIC_VECTOR(7 downto 0);
       B : in STD_LOGIC_VECTOR(7 downto 0);
       O : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component mux4x1
  port (
       I0 : in STD_LOGIC_VECTOR(7 downto 0);
       I1 : in STD_LOGIC_VECTOR(7 downto 0);
       I2 : in STD_LOGIC_VECTOR(7 downto 0);
       I3 : in STD_LOGIC_VECTOR(7 downto 0);
       S : in STD_LOGIC_VECTOR(1 downto 0);
       O : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component SUB8
  port (
       A : in STD_LOGIC_VECTOR(7 downto 0);
       B : in STD_LOGIC_VECTOR(7 downto 0);
       O : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal BUS55 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS59 : STD_LOGIC_VECTOR (7 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

com_ADD : AND8
  port map(
       A => A,
       B => B,
       O => BUS55
  );

com_MUX : mux4x1
  port map(
       I0 => BUS55,
       I1 => BUS59,
       I2(0) => Dangling_Input_Signal,
       I2(1) => Dangling_Input_Signal,
       I2(2) => Dangling_Input_Signal,
       I2(3) => Dangling_Input_Signal,
       I2(4) => Dangling_Input_Signal,
       I2(5) => Dangling_Input_Signal,
       I2(6) => Dangling_Input_Signal,
       I2(7) => Dangling_Input_Signal,
       I3(0) => Dangling_Input_Signal,
       I3(1) => Dangling_Input_Signal,
       I3(2) => Dangling_Input_Signal,
       I3(3) => Dangling_Input_Signal,
       I3(4) => Dangling_Input_Signal,
       I3(5) => Dangling_Input_Signal,
       I3(6) => Dangling_Input_Signal,
       I3(7) => Dangling_Input_Signal,
       O => O,
       S => Sel
  );

com_SUB : SUB8
  port map(
       A => A,
       B => B,
       O => BUS59
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end miniALU;
