library IEEE;
use IEEE.std_logic_1164.all;

entity DFlipFlop is 

  port (

    D : in std_logic;
  rst : in std_logic;
  CLK : in std_logic;
    Q : out std_logic;
 Qbar : out std_logic

 );

end DFlipFlop;

architecture behavioural of DFlipFlop is
begin
  
  process (rst, CLK)
  begin

  if rst = '1' then
    Q <= '0';
  elsif rising_edge(CLK) then
    Q <= D;

  end if;
 end process;

Qbar <= not Q;
end behavioural;
