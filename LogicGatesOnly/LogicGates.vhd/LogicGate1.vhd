library IEEE;
use IEEE.std_logic_1164.all;

entity logic_diagram is 

  port (

    A, B, C_i : in std_logic;  --These are all the 3 inputs from the respective diagram
    C_o, S : out std_logic     --These are all the 2 outputs from the respective diagram

  );

end logic_diagram;

architecture behavioural of logic_diagram is 

  signal X, Y, Z : std_logic; --These represent signals because they're outputs and inputs at the same time within the logic gate diagram

begin

  X <= A xor B;     --Logic equation for signal X
  Y <= A and B;     --Logic equation for signal Y
  Z <= X and C_i;   --Logic equation for signal Z (Additionally Z can be re-written as Z <= (A xor B) and C_i)

  S <= X xor C_i;   --Logic equation for S (Additionally S can be re-written as S <= (A xor B) xor C_i
  C_o <= Y or Z;    --Logic equation for C_o (To break it down into 2 steps: 1). C_o can be written as C_o <= (A and B) or (X and C_i)  2). As X <= A xor B, this concludes that C_o can be written as C_o <= (A and B) or ((A xor B) and C_i)

end behavioural;

--Final: S <= (A xor B) xor C_i
--Final: C_o <= (A and B) or ((A xor B) and C_i)
