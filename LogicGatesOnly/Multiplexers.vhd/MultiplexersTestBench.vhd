library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexers_testbench is
end multiplexers_testbench;

architecture behavioural of multiplexers_testbench is 
  component multiplexers_test is

  port (
    I0, I1, I2, I3     : in std_logic_vector(15 downto 0);  -- Inputs for 1st bottom multiplexer
    I4, I5, I6, I7     : in std_logic_vector(15 downto 0);  -- Inputs for 2nd bottom multiplexer 
    I8, I9, I10, I11   : in std_logic_vector(15 downto 0);  -- Inputs for 3rd bottom multiplexer
    I12, I13, I14, I15 : in std_logic_vector(15 downto 0);  -- Inputs for 4th bottom multiplexer

    S0, S1 : in std_logic;  -- Selectors for all 4 bottom multiplexers
    S2, S3 : in std_logic;  -- Selectors for the top multiplexer

    F : out std_logic_vector(15 downto 0)  -- Final Output
  );
end component; 

  
signal I0, I1, I2, I3     : std_logic_vector(15 downto 0);
signal I4, I5, I6, I7     : std_logic_vector(15 downto 0);  --All internal signals in vector form like the component port section
signal I8, I9, I10, I11   : std_logic_vector(15 downto 0);
signal I12, I13, I14, I15 : std_logic_vector(15 downto 0);
signal F                  : std_logic_vector(15 downto 0);
  
signal S0, S1, S2, S3     : std_logic;

begin

  uut: multiplexers_test port map(I0 => I0, I1 => I1,  I2 => I2,  I3 => I3,  I4 => I4,  I5 => I5,  I6 => I6,  I7 => I7,  I8 => I8,  I9 => I9,  I10 => I10,  I11 => I11,  I12 => I12,  
                                  I13 => I13,  I14 => I14, I15 => I15,  S0 => S0,  S1 => S1,  S2 => S2,  S3 => S3, F => F);  
  multiplexers_process: process
  begin

   -- 1. Initialize Inputs with distinct values so we can track them
    I0  <= x"0000"; I1  <= x"1111"; I2  <= x"2222"; I3  <= x"3333";
    I4  <= x"4444"; I5  <= x"5555"; I6  <= x"6666"; I7  <= x"7777";
    I8  <= x"8888"; I9  <= x"9999"; I10 <= x"AAAA"; I11 <= x"BBBB";    --Examples of sample inputs
    I12 <= x"CCCC"; I13 <= x"DDDD"; I14 <= x"EEEE"; I15 <= x"FFFF";

    -- 2. Test different select line combinations (S3 S2 S1 S0)
    
    -- Test Case 1: Select I0 (Binary: 0000) -> F should be x"0000"
    S3 <= '0'; S2 <= '0'; S1 <= '0'; S0 <= '0'; wait for 10 ns;
    assert (F = x"0000") report "Test Case 1 Failed" severity error;
    
    -- Test Case 2: Select I5 (Binary: 0101) -> F should be x"5555"
    S3 <= '0'; S2 <= '1'; S1 <= '0'; S0 <= '1'; wait for 10 ns;
    assert (F = x"5555") report "Test Case 2 Failed" severity error;

    -- Test Case 3: Select I10 (Binary: 1010) -> F should be x"AAAA"
    S3 <= '1'; S2 <= '0'; S1 <= '1'; S0 <= '0'; wait for 10 ns;
    assert (F = x"AAAA") report "Test Case 3 Failed" severity error;

    -- Test Case 4: Select I15 (Binary: 1111) -> F should be x"FFFF"
    S3 <= '1'; S2 <= '1'; S1 <= '1'; S0 <= '1'; wait for 10 ns;
    assert (F = x"FFFF") report "Test Case 4 Failed" severity error;

      
   wait;
 end process;
end behavioural;
