library IEEE;
use IEEE.std_logic_1164.all;

entity ripple_adder_proc is 

  port (

    A_0 , A_1 , A_2 , A_3 : in std_logic;    --All 4 (A) inputs for the 4-bit ripple carry adder.
    B_0 , B_1 , B_2 , B_3 : in std_logic;    --All 4 (B) inputs for the 4-bit ripple carry adder.
    C_in : in std_logic;                     --Carry input for the 4-bit ripple carry adder.
    S_0 , S_1 , S_2 , S_3 : out std_logic;   --All 4 (S) outputs for the 4-bit ripple carry adder.
    C_3 : out std_logic                      --Carry output for the 4-bit ripple carry adder.

  );

end ripple_adder;

architecture behavioural of ripple_adder is
  begin 

  ripple_adder_process: process(A_0 , A_1 , A_2 , A_3 , B_0 , B_1 , B_2 , B_3, C_in)  --All inputs are being processed here as the inputs is the one that we can only change (outputs change depending on the inputs)
  variable C_0, C_1, C_2: std_logic; --treated as intermediate signals


  begin

    S_0 <= '0';
    S_1 <= '0';
    S_2 <= '0';    --Outputs initialised
    S_3 <= '0';
    C_3 <= '0';

   -- Bit 0
    S_0  <= A_0 xor B_0 xor C_in;                        -- Signal assignment for port output
    C_0 := (A_0 and B_0) or (C_in and (A_0 xor B_0));   

    -- Bit 1 (Uses v_C0 from above)
    S_1  <= A_1 xor B_1 xor C_0;
    C_1 := (A_1 and B_1) or (C_0 and (A_1 xor B_1));

    -- Bit 2 (Uses v_C1 from above)
    S_2  <= A_2 xor B_2 xor C_1;
    C_2 := (A_2 and B_2) or (C_1 and (A_2 xor B_2));

    -- Bit 3 (Uses v_C2 from above)
    S_3  <= A_3 xor B_3 xor C_2;
    C_3  <= (A_3 and B_3) or (C_2 and (A_3 xor B_3));   -- Signal assignment because C_3 is an output port

  end process ripple_adder_process;
end behavioural;
