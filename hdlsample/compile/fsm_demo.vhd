-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : 
-- Author      : Windows User
-- Company     : DCE, SOICT,HUST
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\hdlsample\hdlsample\compile\fsm_demo.vhd
-- Generated   : 09/27/15 10:13:11
-- From        : c:\My_Designs\hdlsample\hdlsample\src\fsm_demo.asf
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

entity demo is 
	port (
		CLK: in STD_LOGIC;
		Reset: in STD_LOGIC;
		TA: in STD_LOGIC;
		LA: out STD_LOGIC);
end demo;

architecture demo_arch of demo is

-- BINARY ENCODED state machine: Sreg0
attribute enum_encoding: string;
type Sreg0_type is (
    S2, S3, S4, S5, S7, S1, S6, S8
);
attribute enum_encoding of Sreg0_type: type is
	"000 " &		-- S2
	"001 " &		-- S3
	"010 " &		-- S4
	"011 " &		-- S5
	"100 " &		-- S7
	"101 " &		-- S1
	"110 " &		-- S6
	"111" ; 		-- S8

signal Sreg0: Sreg0_type;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (CLK)
begin
	if CLK'event and CLK = '1' then
		if Reset='1' then	
			Sreg0 <= S1;
			-- Set default values for outputs, signals and variables
			-- ...
		else
			-- Set default values for outputs, signals and variables
			-- ...
			case Sreg0 is
				when S2 =>
					Sreg0 <= S3;
				when S3 =>
					if TA='1' then	
						Sreg0 <= S4;
					else
						Sreg0 <= S1;
					end if;
				when S4 =>
					Sreg0 <= S5;
				when S5 =>
					Sreg0 <= S6;
				when S7 =>
					Sreg0 <= S8;
				when S1 =>
					Sreg0 <= S2;
				when S6 =>
					Sreg0 <= S7;
				when S8 =>
					Sreg0 <= S1;
--vhdl_cover_off
				when others =>
					null;
--vhdl_cover_on
			end case;
		end if;
	end if;
end process;

-- signal assignment statements for combinatorial outputs
LA_assignment:
LA <= '1' when (Sreg0 = S2) else
      '1' when (Sreg0 = S3 and TA='1') else
      '0' when (Sreg0 = S6) else
      '0';

end demo_arch;
