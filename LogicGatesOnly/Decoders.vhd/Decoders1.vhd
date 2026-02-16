library IEEE;
use IEEE.std_logic_1164.all;

entity eight_to_three_decoder is (

  port (

    Y : in std_logic_vector(7 downto 0);  --Instead of writing all Y7 to Y0, it's much easier and more efficient to write Y only including 7 downto 0 vector since there's 8 (Y) inputs in total anyways from Y7 to Y0
    A : out std_logic_vector(2 downto 0)  --Exact similar thing for A, 3 (A) outputs in total from A2 to A0 so write A instead of A2 to A0 individually

  );

end eight_to_three decoder;

architecture behavioural of eight_to_three_decoder is

  begin

    Y <= "00000001" when (A = "000") else      --Each single output of Y for all outputs is met if a certain input is met.
         "00000010" when (A = "001") else      --For the equation to satisfy, in binary, the output in decimal must equal 2^input
         "00000100" when (A = "010") else
         "00001000" when (A = "011") else
         "00010000" when (A = "100") else
         "00100000" when (A = "101") else
         "01000000" when (A = "110") else     --In terms of inputs/outputs, the 8 to 3 decoder is set from 0 to 7 and gives only: 2^input = output as a specific condition only to be written in binary for both
         "10000000" when (A = "111") else     --As such, inputs are written in 3-bit form and outputs are written in 8-bit form
         "00000000"; -- by default (invalid inputs)

  end behavioural;
