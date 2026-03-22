library IEEE;
use IEEE.std_logic_1164.all;

entity three_to_eight_decoder_proc is 

  port  (

    Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0 : out std_logic;   --All 7 outputs stated
    A2, A1, A0 : in std_logic                         --All 3 inputs stated   (longer version code for this)

  );


end three_to_eight_decoder_proc

architecture behavioural of three_to_eight_decoder_proc is 

  begin

  three_to_eight_decoder_process: process (A2, A1, AO)
    begin

    Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0 <= 0;

    if (A2 = '0' and A1 = '0' and A0 = '0') then
      Y0 <= '1';
    elsif (A2 = '0' and A1 = '0' and A0 = '1') then
      Y1 <= '1';
    elsif (A2 = '0' and A1 = '1' and A0 = '0') then
      Y2 <= '1';
    elsif (A2 = '0' and A1 = '1' and A0 = '1') then
      Y3 <= '1';
    elsif (A2 = '1' and A1 = '0' and A0 = '0') then
      Y4 <= '1';
    elsif (A2 = '1' and A1 = '0' and A0 = '1') then
      Y5 <= '1';
    elsif (A2 = '1' and A1 = '1' and A0 = '0') then
      Y6 <= '1';
    elsif (A2 = '1' and A1 = '1' and A0 = '1') then
      Y7 <= '1';

  end three_to_eight_decoder_process;
end behavioural;
