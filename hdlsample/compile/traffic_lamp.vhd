-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : 
-- Author      : Windows User
-- Company     : DCE, SOICT,HUST
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\hdlsample\hdlsample\compile\traffic_lamp.vhd
-- Generated   : 09/27/15 10:13:12
-- From        : c:\My_Designs\hdlsample\hdlsample\src\traffic_lamp.asf
-- By          : FSM2VHDL ver. 5.0.6.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Traffic_Lamp is 
	port (
		CLK: in STD_LOGIC;
		Reset: in STD_LOGIC;
		TA: in STD_LOGIC;
		TB: in STD_LOGIC;
		LA: out STD_LOGIC_VECTOR (1 downto 0);
		LB: out STD_LOGIC_VECTOR (1 downto 0));
end Traffic_Lamp;

architecture Traffic_Lamp_arch of Traffic_Lamp is

-- GRAY ENCODED state machine: Sreg0
attribute enum_encoding: string;
type Sreg0_type is (
    S2, S3, S4, S0
);
attribute enum_encoding of Sreg0_type: type is
	"00 " &		-- S2
	"01 " &		-- S3
	"11 " &		-- S4
	"10" ; 		-- S0

signal Sreg0: Sreg0_type;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (CLK, reset)
constant DO: std_logic_vector(1 downto 0) := B"00";
constant VANG: std_logic_vector(1 downto 0) := B"01";
constant XANHG: std_logic_vector(1 downto 0) := B"11";

begin
	if Reset='1' then	
		Sreg0 <= S0;
		-- Set default values for outputs, signals and variables
		-- ...
	elsif CLK'event and CLK = '1' then
		-- Set default values for outputs, signals and variables
		-- ...
		case Sreg0 is
			when S2 =>
				if TB='1' then	
					Sreg0 <= S2;
				elsif TB='0' then	
					Sreg0 <= S3;
				end if;
			when S3 =>
				Sreg0 <= S0;
			when S4 =>
				Sreg0 <= S2;
			when S0 =>
				if TA='1' then	
					Sreg0 <= S0;
				elsif TA='0' then	
					Sreg0 <= S4;
				end if;
--vhdl_cover_off
			when others =>
				null;
--vhdl_cover_on
		end case;
	end if;
end process;

-- signal assignment statements for combinatorial outputs
LA_assignment:
LA <= "00" when (Sreg0 = S0) else
      "11" when (Sreg0 = S2) else
      "11" when (Sreg0 = S3) else
      "01" when (Sreg0 = S4) else
      "00";

LB_assignment:
LB <= "11" when (Sreg0 = S0) else
      "00" when (Sreg0 = S2) else
      "01" when (Sreg0 = S3) else
      "11" when (Sreg0 = S4) else
      "11";

end Traffic_Lamp_arch;
