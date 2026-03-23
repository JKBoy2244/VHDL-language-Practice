library IEEE;
use IEEE.std_logic_1164.all;

entity decoders_testbench is
end decoders_testbench;

architecture behavioural of decoders_testbench is
  component decoders_test is 

    port  (

    Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0 : out std_logic;   --All 8 outputs stated
    A2, A1, A0 : in std_logic                         --All 3 inputs stated   (longer version code for this)

  );

  end component;
  signal Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0, A2, A1, A0 : std_logic;

  begin

    uut: decoders_test port map(Y7 => Y7, Y6 => Y6, Y5 => Y5, Y4 => Y4, Y3 => Y3, Y2 => Y2, Y1 => Y1, Y0 => Y0, A2 => A2, A1 => A1, A0 => A0); --Internal signals these are 
    process_stimulate: process --Prepares for the process testing

    begin

      A2 <= '0'; A1 <= '0'; A0 <= '0'; wait for 10 ns;
      A2 <= '0'; A1 <= '0'; A0 <= '1'; wait for 10 ns;
      A2 <= '0'; A1 <= '1'; A0 <= '0'; wait for 10 ns;
      A2 <= '0'; A1 <= '1'; A0 <= '1'; wait for 10 ns;
      A2 <= '1'; A1 <= '0'; A0 <= '0'; wait for 10 ns;
      A2 <= '1'; A1 <= '0'; A0 <= '1'; wait for 10 ns;
      A2 <= '1'; A1 <= '1'; A0 <= '0'; wait for 10 ns;
      A2 <= '1'; A1 <= '1'; A0 <= '1'; wait for 10 ns;
      wait;
   end process;
end behavioural;
