library IEEE;
use IEEE.std_logic_1164.all;

entity encoders_testbench is
end encoders_testbench;

architecture behavioural of encoders_testbench is
  component encoders_test is

    port (

    Y7, Y6,Y5, Y4, Y3, Y2, Y1, Y0: in std_logic;   --All 8 inputs stated
    A2, A1, A0: out std_logic                      --All 3 outputs stated

 );

 end component;
 signal Y7, Y6,Y5, Y4, Y3, Y2, Y1, Y0, A2, A1, A0: std_logic;

 begin

   uut: encoders_test port map(Y7 => Y7, Y6 => Y6, Y5 => Y5, Y4 => Y4, Y3 => Y3, Y2 => Y2, Y1 => Y1, Y0 => Y0, A2 => A2, A1 => A1, A0 => A0); --Internal signals these are
   encodersProcess_stimulate: process --Prepares for the process testing

   begin

     Y7 <= '1'; Y6 <= '0'; Y5 <= '0'; Y4 <= '0'; Y3 <= '0'; Y2 <= '0'; Y1 <= '0'; Y0 <= '0'; wait for 10 ns;
     Y7 <= '0'; Y6 <= '1'; Y5 <= '0'; Y4 <= '0'; Y3 <= '0'; Y2 <= '0'; Y1 <= '0'; Y0 <= '0'; wait for 10 ns;    --All the possible test case inputs
     Y7 <= '0'; Y6 <= '0'; Y5 <= '1'; Y4 <= '0'; Y3 <= '0'; Y2 <= '0'; Y1 <= '0'; Y0 <= '0'; wait for 10 ns;
     Y7 <= '0'; Y6 <= '0'; Y5 <= '0'; Y4 <= '1'; Y3 <= '0'; Y2 <= '0'; Y1 <= '0'; Y0 <= '0'; wait for 10 ns;
     Y7 <= '0'; Y6 <= '0'; Y5 <= '0'; Y4 <= '0'; Y3 <= '1'; Y2 <= '0'; Y1 <= '0'; Y0 <= '0'; wait for 10 ns;
     Y7 <= '0'; Y6 <= '0'; Y5 <= '0'; Y4 <= '0'; Y3 <= '0'; Y2 <= '1'; Y1 <= '0'; Y0 <= '0'; wait for 10 ns;
     Y7 <= '0'; Y6 <= '0'; Y5 <= '0'; Y4 <= '0'; Y3 <= '0'; Y2 <= '0'; Y1 <= '1'; Y0 <= '0'; wait for 10 ns;
     Y7 <= '0'; Y6 <= '0'; Y5 <= '0'; Y4 <= '0'; Y3 <= '0'; Y2 <= '0'; Y1 <= '0'; Y0 <= '1'; wait for 10 ns;

     Y7 <= '0'; Y6 <= '0'; Y5 <= '0'; Y4 <= '0'; Y3 <= '0'; Y2 <= '0'; Y1 <= '0'; Y0 <= '0'; wait for 10 ns;   --Bottom 2 are actual edge cases to see what happens in unexpected situations
     Y7 <= '1'; Y6 <= '1'; Y5 <= '0'; Y4 <= '0'; Y3 <= '0'; Y2 <= '0'; Y1 <= '0'; Y0 <= '1'; wait for 10 ns;
     wait;
   end process;
end behavioural;
