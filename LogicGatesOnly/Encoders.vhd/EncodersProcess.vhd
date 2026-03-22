library IEEE; 
use IEEE.std_logic_1164.all;

entity encoders_proc is

  port (

    Y7, Y6,Y5, Y4, Y3, Y2, Y1, Y0: in std_logic;
    A2, A1, A0: out std_logic

 );

end encoders_proc;

architecture behavioural of encoders_proc is
  begin

  encoders_process: process (Y7, Y6,Y5, Y4, Y3, Y2, Y1, Y0)
  begin

  A2 <= '0';
  A1 <= '0';
  A0 <= '0';

  if (Y7 = '0' and Y6 = '0' and Y5 = '0' and Y4 = '0' and Y3 = '0' and Y2 = '0' and Y1 = '0' and Y0 = '1') then
    A2 <= '0';
    A1 <= '0';
    A0 <= '0';
  elsif (Y7 = '0' and Y6 = '0' and Y5 = '0' and Y4 = '0' and Y3 = '0' and Y2 = '0' and Y1 = '1' and Y0 = '0') then
    A2 <= '0';
    A1 <= '0';
    A0 <= '1';
  elsif (Y7 = '0' and Y6 = '0' and Y5 = '0' and Y4 = '0' and Y3 = '0' and Y2 = '1' and Y1 = '0' and Y0 = '0') then
    A2 <= '0';
    A1 <= '1';
    A0 <= '0';
  elsif (Y7 = '0' and Y6 = '0' and Y5 = '0' and Y4 = '0' and Y3 = '1' and Y2 = '0' and Y1 = '0' and Y0 = '0') then
    A2 <= '0';
    A1 <= '1';
    A0 <= '1';
  elsif (Y7 = '0' and Y6 = '0' and Y5 = '0' and Y4 = '1' and Y3 = '0' and Y2 = '0' and Y1 = '0' and Y0 = '0') then
    A2 <= '1';
    A1 <= '0';
    A0 <= '0';
  elsif (Y7 = '0' and Y6 = '0' and Y5 = '1' and Y4 = '0' and Y3 = '0' and Y2 = '0' and Y1 = '0' and Y0 = '0') then
    A2 <= '1';
    A1 <= '0';
    A0 <= '1';
  elsif (Y7 = '0' and Y6 = '1' and Y5 = '0' and Y4 = '0' and Y3 = '0' and Y2 = '0' and Y1 = '0' and Y0 = '0') then
    A2 <= '1';
    A1 <= '1';
    A0 <= '0';
  elsif (Y7 = '1' and Y6 = '0' and Y5 = '0' and Y4 = '0' and Y3 = '0' and Y2 = '0' and Y1 = '0' and Y0 = '0') then
    A2 <= '1';
    A1 <= '1';
    A0 <= '1';
  end if;
 end process encoders_process;
end behavioural;
    
