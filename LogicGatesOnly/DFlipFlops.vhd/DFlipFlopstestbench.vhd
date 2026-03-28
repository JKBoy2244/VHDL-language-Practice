library IEEE;
use IEEE.std_logic_1164.all;
 
entity shiftRegister_testbench is                                                                            -- Empty Entity (No ports because a testbench is a closed simulation environment)
end shiftRegister_testbench;

architecture behavioural of shiftRegister_testbench is

  component shiftRegister_Dflipflop is
    port (
      D, clk : in std_logic;                   
      Q3     : out std_logic                                                                                       -- Declare the Unit Under Test (UUT)    (Q3 is the main output of the shift register)
    );
  end component;

  signal clk : std_logic := '0';
  signal D   : std_logic := '0';                                                                                       -- Signals to connect to the UUT
  signal Q  : std_logic;

begin

  uut: shiftRegister_Dflipflop port map (D => D, clk => clk, Q3  => Q);                                               -- Instantiate the Shift Register and wire it to our test signalsclk => clk,

  clk_process: process
  begin
    clk <= '0';
    wait for 10 ns;                                                                                                    -- This creates a continuous square wave that toggles every 10 ns (the clock generation process)
    
    clk <= '1';
    wait for 10 ns;
      
  end process;

  stim_process: process
  begin
                                                                                                              -- This feeds a specific sequence of bits into the 'D' input (The Data Stimulus Process)
    wait for 20 ns;                                                                                           -- Wait a moment before starting

    -- Let's shift in the pattern: 1, 0, 1, 1

    D <= '1';                                                                                                -- Shift in a '1'
    wait for 10 ns;                                                                                         -- Wait for 1 clock cycle for the flip-flop to grab it

    -- Shift in a '0'
    D <= '0';                                                                                               -- Shift in a '0'
    wait for 10 ns;

                                                                                                            -- Shift in a '1'
    D <= '1';
    wait for 10 ns;

    
    D <= '1';                                                                                              -- Shift in another '1'
    wait for 10 ns;

                                                                                                          -- Feed '0's to push the rest of the data through the register
     D <= '0';
    wait for 25 ns; 

                                                                                                           -- End the simulation
      
    assert false report "Simulation Finished" severity failure;
    wait;
  end process;

end behavioural;
