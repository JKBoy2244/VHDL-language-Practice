library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexer_sixteen is 

  port (

    I0, I1, I2, I3 : in std_logic_vector(15 downto 0);       --Inputs for 1st bottom multiplexer
    I4, I5, I6, I7 : in std_logic_vector(15 downto 0);       --Inputs for 2nd bottom multiplexer        --Also, from lines 8 to 11, the 'std_logic_vector(15 downto 0)' represents 16-bit inputs in the diagram/code
    I8, I9, I10, I11 : in std_logic_vector(15 downto 0);     --Inputs for 3rd bottom multiplexer
    I12, I13, I14, I15 : in std_logic_vector(15 downto 0);   --Inputs for 4th bottom multiplexer

    S0, S1 : in std_logic;  --Selectors for all 4 bottom multiplexers
    S2, S3 : in std_logic;  --Selectors for the top multiplexer only consisting of all 4 bottom multiplexers     --Presumably, we say selectors are separate inputs as these are the ones that control the actual I inputs regardless

    F : out std_logic_vector(15 downto 0)  --Output for the entire 16x1 multiplexer which consists of 16 inputs in total (Output for the top multiplexer)

  );

end multiplexer_sixteen;

architecture behavioural of multiplexer_sixteen is 

  signal O1, O2, O3, O4 : std_logic_vector(15 downto 0); --The four signals which are all both outputs and inputs and mainly influenced by all 16 inputs in the multiplexer

begin 

  with (S1 & S0) select  --Right now, both selectors S0 & S1 are being used to control all inputs for the 1st bottom multiplexer (and the remaining 3 but this part is just for the 1st multiplexer)

    O1 <= I0 when "00",
          I1 when "01",
          I2 when "10",   --The output present/displays the input for each input if the binary condition is satisfied.
          I3 when "11",
          (others => '0') when others; --By default

  with (S1 & S0) select  --Right now, both selectors S0 & S1 are being used to control all inputs for the 1st bottom multiplexer (and the remaining 3 but this part is just for the 1st multiplexer)

    O2 <= I4 when "00",
          I5 when "01",
          I6 when "10",   --The output present/displays the input for each input if the binary condition is satisfied.
          I7 when "11",
          (others => '0') when others; --By default

  with (S1 & S0) select  --Right now, both selectors S0 & S1 are being used to control all inputs for the 1st bottom multiplexer (and the remaining 3 but this part is just for the 1st multiplexer)

    O3 <= I8 when "00",
          I9 when "01",
          I10 when "10",   --The output present/displays the input for each input if the binary condition is satisfied.
          I11 when "11",
          (others => '0') when others; --By default

  with (S1 & S0) select  --Right now, both selectors S0 & S1 are being used to control all inputs for the 1st bottom multiplexer (and the remaining 3 but this part is just for the 1st multiplexer)

    O4 <= I12 when "00",
          I13 when "01",
          I14 when "10",   --The output present/displays the input for each input if the binary condition is satisfied.
          I15 when "11",
          (others => '0') when others; --By default

  with (S3 & S2) select  --Since all the operations within and including all 4 4x1 bottom multiplexers are complete, we move on to the top 4x1 multiplexer where now S2 & S3 selectors are being used to control all 4 outputs obtained by each bottom multiplexers

    F <= O1 when "00",
         O2 when "01",
         O3 when "10",   --The output present/displays the input for each input if the binary condition is satisfied.
         O4 when "11",
         (others => '0') when others; --By default

  end behavioural;
