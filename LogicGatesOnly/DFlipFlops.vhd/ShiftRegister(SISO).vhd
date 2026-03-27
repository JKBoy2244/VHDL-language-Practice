library IEEE;
use IEEE.std_logic_1164.all;

entity shiftRegister is                  --This is specifically shift-in shift-out (SISO) register

  port (

     D , clk : in std_logic;     --All inputs
     Q3 : out std_logic          --All outputs
    
  );

end shiftRegister;

architecture behavioural of shiftRegister is

  signal Q0, Q1, Q2 : std_logic;          --All internal signals that are between the inputs and output of the shift register made up of 4 D flip-flops
begin

  process (clk)
  begin

    if rising_edge(clk) then    --If clk ='1' and clk'event
      Q0 <= D;
      Q1 <= Q0;
      Q2 <= Q1;
      Q3 <= Q2;

    end if;
  end process;
end architecture;

  
