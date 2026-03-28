library IEEE;
use IEEE.std_logic_1164.all;

entity rippleCounter_portmap is
  port (
     -- Removed the T vector since the diagram hardwires them to '1'
     clk : in std_logic;
     Q0, Q1, Q2, Q3 : out std_logic
    );
end rippleCounter_portmap;

architecture behavioural of rippleCounter_portmap is 

  -- Renamed to T_flipflop to avoid confusion, and added Q_bar
  component T_flipflop is
     port  (
       T     : in std_logic;
       clk   : in std_logic;
       Q     : out std_logic;
       Q_bar : out std_logic  -- Added so we can drive the next clocks!
    );
  end component; -- Added the missing semicolon

  -- Internal signals to connect the stages
  signal clk1, clk2, clk3 : std_logic;

begin

  FF0 : T_flipflop port map (
    T     => '1',   -- Tied to '1' as per diagram
    clk   => clk,   -- Main clock
    Q     => Q0,    -- Main output
    Q_bar => clk1   -- This drives the next flip-flop's clock
  );

  FF1 : T_flipflop port map (
    T     => '1',
    clk   => clk1,  -- Driven by FF0's Q_bar
    Q     => Q1,
    Q_bar => clk2   -- This drives the next flip-flop's clock
  );

  FF2 : T_flipflop port map (
    T     => '1',
    clk   => clk2,  -- Driven by FF1's Q_bar
    Q     => Q2,
    Q_bar => clk3   -- This drives the next flip-flop's clock
  );

  FF3 : T_flipflop port map (
    T     => '1',
    clk   => clk3,  -- Driven by FF2's Q_bar
    Q     => Q3,
    Q_bar => open   -- "open" leaves this unconnected, as it's the last stage
  );

end behavioural;
