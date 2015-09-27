-------------------------------------------------------------------------------
--
-- Title       : Shift_Register
-- Design      : hdlsample
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : W:\workspaces\activehdl\hdlsample\hdlsample\compile\shift_register.vhd
-- Generated   : Sun Sep 27 10:18:42 2015
-- From        : W:\workspaces\activehdl\hdlsample\hdlsample\src\shift_register.bde
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


entity Shift_Register is
  port(
       CLK : in STD_LOGIC;
       DIN : in STD_LOGIC;
       Reset : in STD_LOGIC;
       DOUT : out STD_LOGIC_VECTOR(2 downto 0)
  );
end Shift_Register;

architecture Shift_Register of Shift_Register is

---- Component declarations -----

component DFF_R
  port (
       CLK : in STD_LOGIC;
       D : in STD_LOGIC;
       Rst : in STD_LOGIC;
       Q : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET179 : STD_LOGIC;
signal NET192 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : DFF_R
  port map(
       CLK => CLK,
       D => DIN,
       Q => NET179,
       Rst => Reset
  );

U2 : DFF_R
  port map(
       CLK => CLK,
       D => NET179,
       Q => NET192,
       Rst => Reset
  );

U3 : DFF_R
  port map(
       CLK => CLK,
       D => NET192,
       Q => DOUT(2),
       Rst => Reset
  );

DOUT(0) <= NET179;

DOUT(1) <= NET192;


end Shift_Register;
