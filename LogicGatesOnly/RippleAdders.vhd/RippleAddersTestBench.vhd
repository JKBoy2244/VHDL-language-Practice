library IEEE;
use IEEE.std_logic_1164.all;

entity rippleAdders_testbench is
end rippleAdders_testbench;

architecture behavioural of rippleAdders_testbench is
  component rippleAdders_test is

   port (

    A_0 , A_1 , A_2 , A_3 : in std_logic;    --All 4 (A) inputs for the 4-bit ripple carry adder.
    B_0 , B_1 , B_2 , B_3 : in std_logic;    --All 4 (B) inputs for the 4-bit ripple carry adder.
    C_in : in std_logic;                     --Carry input for the 4-bit ripple carry adder.
    S_0 , S_1 , S_2 , S_3 : out std_logic;   --All 4 (S) outputs for the 4-bit ripple carry adder.
    C_3 : out std_logic                      --Carry output for the 4-bit ripple carry adder.

  );

 end component;
 signal A_0 , A_1 , A_2 , A_3, B_0 , B_1 , B_2 , B_3, C_in, S_0 , S_1 , S_2 , S_3, C_3: std_logic;

 begin

   uut: rippleAdders_test port map(A_0 => A_0, A_1 => A_1,  A_2 => A_2,  A_3 => A_3,  B_0 => B_0,  B_1 => B_1,  B_2 => B_2,  B_3 => B_3,  C_in => C_in,  S_0 => S_0,  S_1 => S_1,  S_2 => S_2,  S_3 => S_3,  C_3 => C_3);
   rippleAdders_process: process

   begin
     
     A_0 <= '0'; A_1 <= '0';  A_2 <= '0';  A_3 <= '0';  B_0 <= '0';  B_1 <= '0';  B_2 <= '0';  B_3 <= '0';  C_in <= '0'; wait for 10 ns;
     assert S3 = '0' and S2 ='0' and S1 = '0' and S0 = '0' and C_out= '0' report "Test Case 1 Failed: 0+0 should be 0" severity error;           --Just a few test cases since doing 2^8 combinations each would be too exhaustive
       
     A_0 <= '1'; A_1 <= '0'; A_2 <= '0'; A_3 <= '0';  B_0 <= '1'; B_1 <= '0'; B_2 <= '0'; B_3 <= '0';  C_in <= '0'; wait for 10 ns;
     assert S3 = '0' and S2 ='0' and S1 = '0' and S0 = '1' and C_out= '0' report "Test Case 2 Failed" severity error;
       
     A_0 <= '1'; A_1 <= '0'; A_2 <= '1'; A_3 <= '0';  B_0 <= '1'; B_1 <= '1'; B_2 <= '0'; B_3 <= '0';  C_in <= '0'; wait for 10 ns; 
     assert S3 = '1' and S2 ='0' and S1 = '0' and S0 = '0' and C_out= '0' report "Test Case 3 Failed" severity error;       
                                                                                                                                                         
     
     wait;
  end process;
end behavioural;
