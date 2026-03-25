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
      assert C_o = '0' and S = '0' report "(A <= '0'; B <= '0'; C_i <= '0'; failed)" severity error;    --Each set of inputs are tested for every single combination individually and the assertion is for the expected outputs and severity error is if wrong output.

      A <= '0'; B <= '0'; C_i <= '1'; wait for 10 ns;
      assert C_o = '0' and S = '1' report "(A <= '0'; B <= '0'; C_i <= '1'; failed)" severity error;

      A <= '0'; B <= '1'; C_i <= '0'; wait for 10 ns;
      assert C_o = '0' and S = '1' report "(A <= '0'; B <= '1'; C_i <= '0'; failed)" severity error;

      A <= '0'; B <= '1'; C_i <= '1'; wait for 10 ns;
      assert C_o = '1' and S = '0' report "(A <= '0'; B <= '1'; C_i <= '1'; failed)" severity error;

      A <= '1'; B <= '0'; C_i <= '0'; wait for 10 ns;
      assert C_o = '0' and S = '1' report "(A <= '1'; B <= '0'; C_i <= '0'; failed)" severity error;

      A <= '1'; B <= '0'; C_i <= '1'; wait for 10 ns;
      assert C_o = '1' and S = '0' report "(A <= '1'; B <= '0'; C_i <= '1'; failed)" severity error;

      A <= '1'; B <= '1'; C_i <= '0'; wait for 10 ns;
      assert C_o = '1' and S = '0' report "(A <= '1'; B <= '1'; C_i <= '0'; failed)" severity error;

      A <= '1'; B <= '1'; C_i <= '1'; wait for 10 ns;
      assert C_o = '1' and S = '1' report "(A <= '1'; B <= '1'; C_i <= '1'; failed)" severity error;
    
      wait;
   end process;
 end behavioural;     
