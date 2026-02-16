library IEEE;
use IEEE.std_logic_1164.all;

entity three_to_eight_decoder_version_two is 

  port  (

    Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0 : out std_logic;   --All 7 outputs stated
    A2, A1, A0 : in std_logic                         --All 3 inputs stated   (longer version code for this)

  );

end three_to_eight_decoder_version_two;

architecture behavioural of three_to_eight_decoder_version_two is 

  begin 

    Y0 <= '1' when (A2 = '0' and A1 = '0' and A0 = '0') else            --2^0 = 1 condition
          '0';

    Y1 <= '1' when (A2 = '0' and A1 = '0' and A0 = '1') else            --2^1 = 2 condition 
          '0';

    Y2 <= '1' when (A2 = '0' and A1 = '1' and A0 = '0') else            --2^2 = 4 condition
          '0';

    Y3 <= '1' when (A2 = '0' and A1 = '1' and A0 = '1') else            --2^3 = 8 condition
          '0';

    Y4 <= '1' when (A2 = '1' and A1 = '0' and A0 = '0') else            --2^4 = 16 condition
          '0';

    Y5 <= '1' when (A2 = '1' and A1 = '0' and A0 = '1') else            --2^5 = 32 condition
          '0';

    Y6 <= '1' when (A2 = '1' and A1 = '1' and A0 = '0') else            --2^6 = 64 condition
          '0';

    Y7 <= '1' when (A2 = '1' and A1 = '1' and A0 = '1') else            --2^7 = 128 condition
          '0';

end behavioural;
