library IEEE;
use IEEE.std_logic_1164.all;

entity ripple_subtractor is      --Precisely the same thing/structure as a ripple adder diagram. Main difference is a). input names have changed and b). this time the diagram is exactly the same but one difference only is that each 4 adders, there's a not Y diagram
                                 --rather than a B diagram so each 4 has a not diagram attached to Y only

  port (

    X_zero, B_zero : in std_logic;      --Same logic
    X_one, B_one : in std_logic;
    X_two, B_two : in std_logic;
    X_three, B_three : in std_logic;    --By the way for ripple subtractor diagrams, the most important input B represents the borrow input (initially replaced Y) and the X inputs replaced A inputs although the inputs should really be A instead of Y
    C_zero : in std_logic;
    S_zero, S_one, S_two, S_three : out std_logic;
    C_four : out std_logic

    );

end ripple_subtractor;

architecture behavioural of ripple_subtractor is

    signal C_one, C_two, C_three : std_logic;

begin

  S_zero <= '0' when (X_zero='0' and B_zero='0' and C_zero='0') else
          '1' when (X_zero='0' and B_zero='0' and C_zero='1') else
          '1' when (X_zero='0' and B_zero='1' and C_zero='0') else
          '0' when (X_zero='0' and B_zero='1' and C_zero='1') else
          '1' when (X_zero='1' and B_zero='0' and C_zero='0') else
          '0' when (X_zero='1' and B_zero='0' and C_zero='1') else
          '0' when (X_zero='1' and B_zero='1' and C_zero='0') else
          '1';  -- (X_zero='1' and B_zero='1' and C_zero='1')

  --S_zero <= (X_zero xor (not B_zero) xor C_zero)

  C_one <= '0' when (X_zero='0' and B_zero='0' and C_zero='0') else
         '1' when (X_zero='0' and B_zero='0' and C_zero='1') else
         '1' when (X_zero='0' and B_zero='1' and C_zero='0') else
         '1' when (X_zero='0' and B_zero='1' and C_zero='1') else
         '0' when (X_zero='1' and B_zero='0' and C_zero='0') else
         '0' when (X_zero='1' and B_zero='0' and C_zero='1') else
         '0' when (X_zero='1' and B_zero='1' and C_zero='0') else
         '1';  -- (X_zero='1' and B_zero='1' and C_zero='1')

  --C_one <= (X_zero and (not B_zero)) or (C_zero and (X_zero xor (not B_zero)));


  S_one <= '0' when (X_one='0' and B_one='0' and C_one='0') else
         '1' when (X_one='0' and B_one='0' and C_one='1') else
         '1' when (X_one='0' and B_one='1' and C_one='0') else
         '0' when (X_one='0' and B_one='1' and C_one='1') else
         '1' when (X_one='1' and B_one='0' and C_one='0') else
         '0' when (X_one='1' and B_one='0' and C_one='1') else
         '0' when (X_one='1' and B_one='1' and C_one='0') else
         '1';

  --S_one <= (X_one xor (not B_one) xor C_one)

  C_two <= '0' when (X_one='0' and B_one='0' and C_one='0') else
         '1' when (X_one='0' and B_one='0' and C_one='1') else
         '1' when (X_one='0' and B_one='1' and C_one='0') else
         '1' when (X_one='0' and B_one='1' and C_one='1') else
         '0' when (X_one='1' and B_one='0' and C_one='0') else
         '0' when (X_one='1' and B_one='0' and C_one='1') else
         '0' when (X_one='1' and B_one='1' and C_one='0') else
         '1';

  --C_two <= (X_one and (not B_one)) or (C_one and (X_one xor (not B_one)));

  S_two <= '0' when (X_two='0' and B_two='0' and C_two='0') else
         '1' when (X_two='0' and B_two='0' and C_two='1') else
         '1' when (X_two='0' and B_two='1' and C_two='0') else
         '0' when (X_two='0' and B_two='1' and C_two='1') else
         '1' when (X_two='1' and B_two='0' and C_two='0') else
         '0' when (X_two='1' and B_two='0' and C_two='1') else
         '0' when (X_two='1' and B_two='1' and C_two='0') else
         '1';

  --S_two <= (X_two xor (not B_two) xor C_two)

  C_three <= '0' when (X_two='0' and B_two='0' and C_two='0') else
           '1' when (X_two='0' and B_two='0' and C_two='1') else
           '1' when (X_two='0' and B_two='1' and C_two='0') else
           '1' when (X_two='0' and B_two='1' and C_two='1') else
           '0' when (X_two='1' and B_two='0' and C_two='0') else
           '0' when (X_two='1' and B_two='0' and C_two='1') else
           '0' when (X_two='1' and B_two='1' and C_two='0') else
           '1';

  --C_three <= (X_two and (not B_two)) or (C_two and (X_two xor (not B_two)));

  S_three <= '0' when (X_three='0' and B_three='0' and C_three='0') else
           '1' when (X_three='0' and B_three='0' and C_three='1') else
           '1' when (X_three='0' and B_three='1' and C_three='0') else
           '0' when (X_three='0' and B_three='1' and C_three='1') else
           '1' when (X_three='1' and B_three='0' and C_three='0') else
           '0' when (X_three='1' and B_three='0' and C_three='1') else
           '0' when (X_three='1' and B_three='1' and C_three='0') else
           '1';  -- (X_three='1' and B_three='1' and C_three='1')

  --S_zero <= (X_three xor (not B_three) xor C_three)

  
  C_four <= '0' when (X_three='0' and B_three='0' and C_three='0') else
          '1' when (X_three='0' and B_three='0' and C_three='1') else
          '1' when (X_three='0' and B_three='1' and C_three='0') else
          '1' when (X_three='0' and B_three='1' and C_three='1') else
          '0' when (X_three='1' and B_three='0' and C_three='0') else
          '0' when (X_three='1' and B_three='0' and C_three='1') else
          '0' when (X_three='1' and B_three='1' and C_three='0') else
          '1';  -- (X_three='1' and B_three='1' and C_three='1')

  --C_four <= (X_three and B_three) or (C_three and (X_three xor (not B_three)));
  
end behavioural;
