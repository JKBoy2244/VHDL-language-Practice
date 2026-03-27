library IEEE;
use IEEE.std_logic_1164.all;

entity parallel_to_serial_conversion is
  port (
    D0, D1, D2, D3 : in std_logic;   -- Parallel inputs
    s_in           : in std_logic;   -- Serial input
    shift_load_n   : in std_logic;   -- MUX Select: 1 = Shift, 0 = Load
    clk            : in std_logic;   -- Clock signal
    Q3             : out std_logic   -- Serial output
  );
end parallel_to_serial_conversion;

architecture behavioural of parallel_to_serial_conversion is
  -- Internal signals to hold the state of the first 3 flip-flops
  signal Q0, Q1, Q2 : std_logic;
begin

  process(clk)
  begin
    if rising_edge(clk) then
      
      -- If shift_load_n is '0', MUXes select input 0 (Parallel Load)
      if shift_load_n = '0' then
        Q0 <= D0;
        Q1 <= D1;
        Q2 <= D2;
        Q3 <= D3;
        
      -- If shift_load_n is '1', MUXes select input 1 (Shift Right)
      else
        Q0 <= s_in;
        Q1 <= Q0;
        Q2 <= Q1;
        Q3 <= Q2;
      end if;
      
    end if;
  end process;

end architecture;
  
