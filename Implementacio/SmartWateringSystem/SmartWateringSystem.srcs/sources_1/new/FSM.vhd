----------------------------------------------------------------------------------
-- University: Sapientia - Hungarian University of Transylvania, Targu Mures
-- Engineer: Nagy Levente - MSc studies - Intelligent Control Systems 
-- 
-- Create Date: 01/05/2020 12:24:57 PM
-- Design Name: Finite State Machine for a Smart Watering System 
-- Module Name: FSM - Behavioral
-- Project Name: Smart Watering System
-- Target Devices: Zybo Z7-10 Development Board
-- Revision: 1.0
-- Description: This project is a semester project for Embedded Systems class. In this project is presented a possible solution for a smart watering system.             
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity FSM is
    Port ( src_CLK : in STD_LOGIC;               -- clock signal
           RESET : in STD_LOGIC;                 -- reset input
           T : in STD_LOGIC;                     -- temperature 
           L : in STD_LOGIC;                     -- light
           M : in STD_LOGIC_VECTOR (2 downto 0); -- moisture
           Y : out STD_LOGIC_VECTOR (1 downto 0);-- state indicator
           Z : out STD_LOGIC);                   -- output
end FSM;

architecture Behavioral of FSM is

type state_type is (ST_init, ST0, ST1);
signal AS,NS : state_type;

begin

sync_proc : process(src_CLK, NS, RESET)
	Begin
		if (RESET = '1') then AS <= ST_init;
		Elsif (falling_edge(src_CLK)) then AS <= NS;
		End if;
	End process sync_proc;

Comb_proc: process(AS,T, L,M)
    Begin
             if (AS = ST_init) then
                NS <= ST0; Z <= '0';
             end if;
              
             if (AS = ST0) and (T = '1' or L = '1') and (M > conv_std_logic_vector(001,3) ) then NS <= ST0; Z <= '0';
             end if;
              
             if (AS = ST0) and (T = '0' and L = '0') and (M > conv_std_logic_vector(011,3) ) then NS <= ST0; Z <= '0';
             end if;
              
             if (AS = ST0) and (T = '0' and L = '0') and (M <= conv_std_logic_vector(011,3) ) then NS <= ST1; Z <= '1';
             end if; 
             
             if (AS = ST1) and (T = '0' and L = '0') and (M <= conv_std_logic_vector(110,3) ) then NS <= ST1; Z <= '1';
             end if;
             
             if (AS = ST1) and (M >= conv_std_logic_vector(111,3) ) then NS <= ST0; Z <= '0';
             end if;
             
             if (AS = ST0) and (T = '1' or L = '1') and (M <= conv_std_logic_vector(001,3) ) then NS <= ST1; Z <= '1';
             end if;     
             
             if (AS = ST1) and (T = '1' or L = '1') and (M < conv_std_logic_vector(011,3) ) then NS <= ST1; Z <= '1';
             end if;
             
             if (AS = ST1) and (T = '1' or L = '1') and (M >= conv_std_logic_vector(011,3) ) then NS <= ST0; Z <= '0';
              end if;                    
          
    End process comb_proc;

    With AS select
            Y <= "00" when ST0,
                 "01" when ST1,
                 "11" when others;

end Behavioral;
