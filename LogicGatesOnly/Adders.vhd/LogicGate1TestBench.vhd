library IEEE;
use IEEE.std_logic_1164.all;

entity test_bench is
end test_bench;

architecture behavioural of test_bench is
  component adder is 

   port (

    A, B, C_i : in std_logic;  --These are all the 3 inputs from the respective diagram
    C_o, S : out std_logic     --These are all the 2 outputs from the respective diagram

  );

  end component;
  signal A, B, C_i, C_o, S: std_logic;

  begin

    uut: adder port map(A => A, B => B, C_i => C_i, C_o => C_o, S => S);
    stimulate_process: process

    begin

      A <= '0'; B <= '0'; C_i <= '0'; wait for 10 ns;
      A <= '0'; B <= '0'; C_i <= '1'; wait for 10 ns;
      A <= '0'; B <= '1'; C_i <= '0'; wait for 10 ns;
      A <= '0'; B <= '1'; C_i <= '1'; wait for 10 ns;
      A <= '1'; B <= '0'; C_i <= '0'; wait for 10 ns;
      A <= '1'; B <= '0'; C_i <= '1'; wait for 10 ns;              
      A <= '1'; B <= '1'; C_i <= '0'; wait for 10 ns;
      A <= '1'; B <= '1'; C_i <= '1'; wait for 10 ns;
    
      wait;
   end process;
 end behavioural;     
