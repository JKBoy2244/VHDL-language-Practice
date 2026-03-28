library IEEE;
use IEEE.std_logic_1164.all;

entity rippleCounter_portmap is

  port (

     T: in std_logic_vector(3 downto 0);
     clk : in std_logic;
     Q0, Q1, Q2, Q3 : out std_logic
    
    );

end rippleCounter_portmap;

architecture behavioural of rippleCounter_portmap is 

  component rippleCounter_Dflipflop is

     port  (

       T : in std_logic;
    clk : in std_logic;
       Q : out std_logic
        
    );

  end component; 

  signal clk1, clk2, clk3 : std_logic;

begin

  D1 : rippleCounter_Dflipflop port map (

    T => T(0),
    clk => clk,
    Q => Q0
    
  );

  D2 : rippleCounter_Dflipflop port map (

    T => T(1),
    clk => clk1,                                                   --For vectors like in std_logic_vector(3 downto 0) like this example, only then can I write T(0) or T(1) with actual parenthesis included.
    Q => Q1
    
  );

 D3 : rippleCounter_Dflipflop port map (

    T => T(2),
    clk => clk2,
    Q => Q2
    
  );

D4 : rippleCounter_Dflipflop port map (

    T => T(3),
    clk => clk3,
    Q => Q3
    
  );

end behavioural;
  
