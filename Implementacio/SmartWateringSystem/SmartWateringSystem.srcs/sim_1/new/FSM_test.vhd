
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.std_logic_arith.all;

entity FSM_tb is
end;

architecture bench of FSM_tb is

  component FSM
      Port ( src_CLK : in STD_LOGIC;
             RESET : in STD_LOGIC;
             T : in STD_LOGIC;
             L : in STD_LOGIC;
             M : in STD_LOGIC_VECTOR (2 downto 0);
             Y : out STD_LOGIC_VECTOR (1 downto 0);
             Z : out STD_LOGIC);
  end component;

  signal src_CLK: STD_LOGIC;
  signal RESET: STD_LOGIC;
  signal T: STD_LOGIC;
  signal L: STD_LOGIC;
  signal M: STD_LOGIC_VECTOR (2 downto 0);
  signal Y: STD_LOGIC_VECTOR (1 downto 0);
  signal Z: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: FSM port map ( src_CLK => src_CLK,
                      RESET   => RESET,
                      T       => T,
                      L       => L,
                      M       => M,
                      Y       => Y,
                      Z       => Z );

  stimulus: process
  begin
    
        -- I
        RESET <= '1';
        M <= conv_std_logic_vector(000,3);
        T <= '0';
        L <= '0';
        wait for clock_period*5;    
       
        -- II
        RESET <= '0';
        M <= conv_std_logic_vector(010,3);
        T <= '1';
        L <= '0';    
        wait for clock_period*5;
       
        -- III
        M <= conv_std_logic_vector(100,3);
        T <= '0';
        L <= '0';
        wait for clock_period*5;
    
        -- IV
        M <= conv_std_logic_vector(011,3);
        T <= '0';
        L <= '0';
        wait for clock_period*5;
        
        -- V
        M <= conv_std_logic_vector(101,3);
        T <= '0';
        L <= '0';    
        wait for clock_period*5;  
     
         
        -- VI
         M <= conv_std_logic_vector(111,3);
        T <= '0';
        L <= '0';
        wait for clock_period*5; 
        
        -- VII
        M <= conv_std_logic_vector(001,3);
        T <= '1';
        L <= '0';
        wait for clock_period*5; 
        
        -- VIII
        M <= conv_std_logic_vector(010,3);
        T <= '0';
        L <= '1';
        wait for clock_period*5; 
        
        -- IX
        M <= conv_std_logic_vector(011,3);
        T <= '1';
        L <= '0';
        wait for clock_period*5; 

    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      src_CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
