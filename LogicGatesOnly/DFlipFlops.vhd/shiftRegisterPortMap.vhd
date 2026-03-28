library IEEE;
use IEEE.std_logic_1164.all;

entity shiftRegister_portmap is                  --This is specifically shift-in shift-out (SISO) register

  port (

     D , clk : in std_logic;     --All inputs
     Q3 : out std_logic          --output
    
  );

end shiftRegister_portmap;

architecture behavioural of shiftRegister_portmap is

  component DFlipFlop is 

     port (

       D, clk : in std_logic;            
       Q : out std_logic                 --This represents a sample Dflipflip component as a small component representation of a shift register (consisting of 4 Dflipflop blocks)
     );

  end component;

  signal Q0, Q1, Q2 : std_logic;         --All internal signal wires

begin
  
    DF1: DFlipFlop port map (

      Q => Q0,                           --As the component is specified inside the architecture we split into 4 port maps since 4 D flip flops in shift register. This is D flip-flop 1 specifying only its input and output ports.
      D => D,
      clk => clk
      
    );

   DF2: DFlipFlop port map (

      Q => Q1,
      D => Q0,                          --As the component is specified inside the architecture we split into 4 port maps since 4 D flip flops in shift register. This is D flip-flop 2 specifying only its input and output ports.
      clk => clk
    );

   DF3: DFlipFlop port map (

      Q => Q2,
      D => Q1,                         --As the component is specified inside the architecture we split into 4 port maps since 4 D flip flops in shift register. This is D flip-flop 3 specifying only its input and output ports.
      clk => clk
      
    );

   DF4: DFlipFlop port map (

     Q => Q3,
     D => Q2,                         --As the component is specified inside the architecture we split into 4 port maps since 4 D flip flops in shift register. This is D flip-flop 4 specifying only its input and output ports.
     clk => clk
      
    );
     
end behavioural;
