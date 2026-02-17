library IEEE;
use IEEE.std_logic_1164.all;

entity ripple_adder is 

  port (

    A_0 , A_1 , A_2 , A_3 : in std_logic;    --All 4 (A) inputs for the 4-bit ripple carry adder.
    B_0 , B_1 , B_2 , B_3 : in std_logic;    --All 4 (B) inputs for the 4-bit ripple carry adder.
    C_in : in std_logic;                     --Carry input for the 4-bit ripple carry adder.
    S_0 , S_1 , S_2 , S_3 : out std_logic;   --All 4 (S) outputs for the 4-bit ripple carry adder.
    C_3 : out std_logic                      --Carry output for the 4-bit ripple carry adder.

  );

end ripple_adder;

architecture behavioural of ripple_adder is

  signal C_0 , C_1 , C_2 : std_logic;      --All 3 (C) signals for the 4-bit ripple carry adder.

begin

  S_0 <= ((A_0 xor B_0) xor C_in);                            --Individual equations for S_0 and C_0 respectively
  C_0 <= (A_0 and B_0) or ((A_0 xor B_0) and C_in);

  S_1 <= ((A_1 xor B_1) xor C_0);                             --Individual equations for S_0 and C_0 respectively
  C_1 <= (A_1 and B_1) or ((A_1 xor B_1) and C_0);

  S_2 <= ((A_2 xor B_2) xor C_1);                            --Individual equations for S_0 and C_0 respectively
  C_2 <= (A_2 and B_2) or ((A_2 xor B_2) and C_1);

  S_3 <= ((A_3 xor B_3) xor C_2);                            --Individual equations for S_0 and C_0 respectively
  C_3 <= (A_3 and B_3) or ((A_3 xor B_3) and C_2);

end behavioural;
