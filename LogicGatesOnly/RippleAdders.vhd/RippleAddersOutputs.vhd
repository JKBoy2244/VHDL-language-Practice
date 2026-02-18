library IEEE;
use IEEE.std_logic_1164.all;

entity ripple_adder is

  port (

    A_zero, B_zero : in std_logic;
    A_one, B_one : in std_logic;
    A_two, B_two : in std_logic;
    A_three, B_three : in std_logic;
    C_in : in std_logic;
    S_zero, S_one, S_two, S_three : out std_logic;
    C_three : out std_logic

    );

end ripple_adder;

architecture behavioural of ripple_adder is

    signal C_zero, C_one, C_two : std_logic;

begin

  S_zero <= '1' when (A_zero = '0' and B_zero = '0' and C_in = '1') else          --List of conditions line by line clearly specifically for S_zero to be 1
            '1' when (A_zero = '0' and B_zero = '1' and C_in = '0') else
            '1' when (A_zero = '1' and B_zero = '0' and C_in = '0') else
            '1' when (A_zero = '1' and B_zero = '1' and C_in = '1') else
            '0';

   --S_zero <= (A_zero xor B_zero xor C_in)

  C_zero <=  '1' when (A_zero = '0' and B_zero = '1' and C_in = '1') else         --List of conditions line by line clearly specifically for C_zero to be 1     
            '1' when (A_zero = '1' and B_zero = '0' and C_in = '1') else
            '1' when (A_zero = '1' and B_zero = '1' and C_in = '0') else
            '1' when (A_zero = '1' and B_zero = '1' and C_in = '1') else
            '0';

  --C_zero <= (A_zero and B_zero) or (C_in and (A_zero xor B_zero));


  S_one <= '1' when (A_one = '0' and B_one = '0' and C_zero = '1') else           --List of conditions line by line clearly specifically for S_one to be 1
            '1' when (A_one = '0' and B_one = '1' and C_zero = '0') else
            '1' when (A_one = '1' and B_one = '0' and C_zero = '0') else
            '1' when (A_one = '1' and B_one = '1' and C_zero = '1') else
            '0';

  --S_one <= (A_one xor B_one xor C_zero)

  C_one <=  '1' when (A_one = '0' and B_one = '1' and C_zero = '1') else          --List of conditions line by line clearly specifically for C_one to be 1
            '1' when (A_one = '1' and B_one = '0' and C_zero = '1') else
            '1' when (A_one = '1' and B_one = '1' and C_zero = '0') else
            '1' when (A_one = '1' and B_one = '1' and C_zero = '1') else
            '0';

  --C_one <= (A_one and B_one) or (C_zero and (A_one xor B_one));

  S_two <= '1' when (A_two = '0' and B_two = '0' and C_one = '1') else           --List of conditions line by line clearly specifically for S_two to be 1
            '1' when (A_two = '0' and B_two = '1' and C_one = '0') else
            '1' when (A_two = '1' and B_two = '0' and C_one = '0') else
            '1' when (A_two = '1' and B_two = '1' and C_one = '1') else
            '0';

  --S_two <= (A_two xor B_two xor C_one)

  C_two <=  '1' when (A_two = '0' and B_two = '1' and C_one = '1') else          --List of conditions line by line clearly specifically for C_two to be 1
            '1' when (A_two = '1' and B_two = '0' and C_one = '1') else
            '1' when (A_two = '1' and B_two = '1' and C_one = '0') else
            '1' when (A_two = '1' and B_two = '1' and C_one = '1') else
            '0';

  --C_three <= (A_two and B_two) or (C_one and (A_two xor B_two));

  S_three <= '1' when (A_three = '0' and B_three = '0' and C_two = '1') else      --List of conditions line by line clearly specifically for S_three to be 1
            '1' when (A_three = '0' and B_three = '1' and C_two = '0') else
            '1' when (A_three = '1' and B_three = '0' and C_two = '0') else
            '1' when (A_three = '1' and B_three = '1' and C_two = '1') else
            '0';

  --S_three <= (A_three xor B_three xor C_two)

  C_three <=  '1' when (A_three = '0' and B_three = '1' and C_two = '1') else      --List of conditions line by line clearly specifically for C_three to be 1
            '1' when (A_three = '1' and B_three = '0' and C_two = '1') else
            '1' when (A_three = '1' and B_three = '1' and C_two = '0') else
            '1' when (A_three = '1' and B_three = '1' and C_two = '1') else
            '0';

  --C_three <= (X_three and Y_three) or (C_two and (X_three xor Y_three));
  
end behavioural;
