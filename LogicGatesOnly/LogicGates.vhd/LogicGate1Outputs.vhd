library IEEE;
use IEEE.std_logic_1164.all;

entity logic_diagram is 

  port (

    A, B, C_i : in std_logic;  --These are all the 3 inputs from the respective diagram
    C_o, S : out std_logic     --These are all the 2 outputs from the respective diagram

  );

end logic_diagram;

architecture behavioural of logic_diagram is 

begin

  C_o <= '1' when (A = '0' and B = '1' and C_i = '1') else
         '1' when (A = '1' and B = '0' and C_i = '1') else    --Conditions for C_o to be 1
         '1' when (A = '1' and B = '1' and C_i = '0') else
         '1' when (A = '1' and B = '1' and C_i = '1') else
         '0';   --Default if anything else

 S <= '1' when (A = '0' and B = '0' and C_i = '1') else
      '1' when (A = '0' and B = '1' and C_i = '0') else      --Conditions for C_o to be 1
      '1' when (A = '1' and B = '0' and C_i = '0') else
      '1' when (A = '1' and B = '1' and C_i = '1') else
      '0';    --Default if anything else
  
end behavioural;
