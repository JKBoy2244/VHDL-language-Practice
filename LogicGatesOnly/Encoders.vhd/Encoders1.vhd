library IEEE;
use IEEE.std_logic_1164.all;

entity eight_to_three_encoder is 

  port (

    Y : in std_logic_vector(7 downto 0);   --The entire code is exactly similar to the three_to_eight_decoder code except one key difference is that the inputs and outputs plus their respective behaviours changed/swapped.
    A : out std_logic_vector(2 downto 0)

);

end eight_to_three_encoder;

architecture behavioural of eight_to_three_encoder is

  begin

    A <= "000" when (Y = "00000001") else
         "001" when (Y = "00000010") else
         "010" when (Y = "00000100") else
         "011" when (Y = "00001000") else
         "100" when (Y = "00010000") else    --2^output = input condition now
         "101" when (Y = "00100000") else
         "110" when (Y = "01000000") else
         "111" when (Y = "10000000") else
         "000";

end behavioural;
