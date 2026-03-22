library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexer_sixteen is 
  port (
    I0, I1, I2, I3     : in std_logic_vector(15 downto 0);  -- Inputs for 1st bottom multiplexer
    I4, I5, I6, I7     : in std_logic_vector(15 downto 0);  -- Inputs for 2nd bottom multiplexer 
    I8, I9, I10, I11   : in std_logic_vector(15 downto 0);  -- Inputs for 3rd bottom multiplexer
    I12, I13, I14, I15 : in std_logic_vector(15 downto 0);  -- Inputs for 4th bottom multiplexer

    S0, S1 : in std_logic;  -- Selectors for all 4 bottom multiplexers
    S2, S3 : in std_logic;  -- Selectors for the top multiplexer

    F : out std_logic_vector(15 downto 0)  -- Final Output
  );
end multiplexer_sixteen;

architecture behavioural of multiplexer_sixteen is 
begin 

  -- The process is sensitive to all inputs and selector lines. 
  -- If any of these change, the process will re-evaluate.
  process(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, S0, S1, S2, S3)
  
    -- We use 'variables' here instead of 'signals' for O1-O4.
    -- Variables update instantly during sequential execution, ensuring the top 
    -- multiplexer has the correct values immediately within the same evaluation step.
    variable O1, O2, O3, O4 : std_logic_vector(15 downto 0);
    variable sel_bottom     : std_logic_vector(1 downto 0);
    variable sel_top        : std_logic_vector(1 downto 0);
    
  begin 
    -- Concatenating the selector bits for cleaner case statements
    sel_bottom := S1 & S0;
    sel_top    := S3 & S2;

    -- 1st bottom multiplexer
    case sel_bottom is 
      when "00"   => O1 := I0;
      when "01"   => O1 := I1;
      when "10"   => O1 := I2;
      when "11"   => O1 := I3;
      when others => O1 := (others => '0'); 
    end case;

    -- 2nd bottom multiplexer
    case sel_bottom is 
      when "00"   => O2 := I4;
      when "01"   => O2 := I5;
      when "10"   => O2 := I6;
      when "11"   => O2 := I7;
      when others => O2 := (others => '0'); 
    end case;

    -- 3rd bottom multiplexer
    case sel_bottom is 
      when "00"   => O3 := I8;
      when "01"   => O3 := I9;
      when "10"   => O3 := I10;
      when "11"   => O3 := I11;
      when others => O3 := (others => '0'); 
    end case;

    -- 4th bottom multiplexer
    case sel_bottom is 
      when "00"   => O4 := I12;
      when "01"   => O4 := I13;
      when "10"   => O4 := I14;
      when "11"   => O4 := I15;
      when others => O4 := (others => '0'); 
    end case;

    -- Top multiplexer (Final Output)
    case sel_top is 
      when "00"   => F <= O1;  -- Output F is a signal port, so we use <=
      when "01"   => F <= O2;
      when "10"   => F <= O3;
      when "11"   => F <= O4;
      when others => F <= (others => '0'); 
    end case;

  end process;

end behavioural;
