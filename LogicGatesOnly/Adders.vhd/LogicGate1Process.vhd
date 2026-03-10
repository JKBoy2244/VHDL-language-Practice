library IEEE;
use IEEE.std_logic_1164.all;

entity LogicGate1_diagram is 

  port (

    A, B, C_i: in std_logic;
    S, C_o: out std_logic

  );
end logicGate1_diagram;

architecture behavioural of LogicGate1_diagram is
begin
  
  LogicGate1_diagram_process: process (A, B, C_i)
  begin

    C_o <= '0';
    S <= '0';
    if (A = '1' and B = '1' and C_i = '0') then
        C_o <= '1';
    elsif (A = '1' and B = '0' and C_i = '1') then
        C_o <= '1';
    elsif (A = '0' and B = '1' and C_i = '1') then
        C_o <= '1';
    elsif (A = '1' and B = '1' and C_i = '1') then
        C_o <= '1';
        S <= '1';
    elsif (A = '1' and B = '0' and C_i = '0') then
        S <= '1';
    elsif (A = '0' and B = '1' and C_i = '0') then
        S <= '1';
    elsif (A = '0' and B = '0' and C_i = '1') then
        S <= '1';
    end if;
 end process LogicGate1_diagram_process;
end behavioural;
