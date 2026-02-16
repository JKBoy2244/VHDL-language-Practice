library IEEE;
use IEEE.std_logic_1164.all;

entity eight_to_three_decoder is 

  port  (

    Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0 : in std_logic;   --All 7 inputs stated
    A2, A1, A0 : out std_logic                       --All 3 inputs stated   (longer version code for this)

  );

end eight_to_three_decoder;

architecture behavioural of eight_to_three_decoder_version_two is 

  begin 

    Y0 <= '1' when (A = '0' and B = '0' and C = '0') else            --2^0 = 1 condition
          '0';

    Y1 <= '1' when (A = '0' and B = '0' and C = '1') else            --2^1 = 2 condition 
          '0';

    Y2 <= '1' when (A = '0' and B = '1' and C = '0') else            --2^2 = 4 condition
          '0';

    Y3 <= '1' when (A = '0' and B = '1' and C = '1') else            --2^3 = 8 condition
          '0';

    Y4 <= '1' when (A = '1' and B = '0' and C = '0') else            --2^4 = 16 condition
          '0';

    Y5 <= '1' when (A = '1' and B = '0' and C = '1') else            --2^5 = 32 condition
          '0';

    Y6 <= '1' when (A = '1' and B = '1' and C = '0') else            --2^6 = 64 condition
          '0';

    Y7 <= '1' when (A = '1' and B = '1' and C = '1') else            --2^7 = 128 condition
          '0';

end behavioural;
