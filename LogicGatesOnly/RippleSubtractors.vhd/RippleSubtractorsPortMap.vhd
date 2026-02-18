library IEEE;
use IEEE.std_logic_1164.all;

entity ripple_adder_port_map is

  port (

    A, B : in std_logic_vector(3 downto 0);  --Inputs for A and B (the reason for vector 3 downto 0 is because there's 4 sets of each of A inputs and B inputs inside the entire 4-bit ripple adder)
    C_in : in std_logic;  --The carry input of the 4-bit ripple adder (it's the only one)
    S : out std_logic_vector(3 downto 0);  --Inputs for S (sum) (the reason again for vector 3 downto 0 is because there's also 4 sets of S outputs across the enture 4-bit ripple adder)
    C_out : out std_logic  --The carry output of the 4-bit ripple adder (it's the only one)

  );

end ripple_adder_port_map;

architecture behavioural of ripple_adder_port_map is

  component full_adder is --As the ripple adder consists of 4 identical full adders which are connected with each other, this component represents a sample of 1 full adder within the 4 full adders combined of a ripple adder for easier mapping.

    port (

      a, b, c_in : in std_logic;  --In a normal ripple adder, a, b and carry input are all inputs so 3 inputs in total.
      s, c_out : out std_logic  --s (sum) and carry output are outputs in a normal ripple adder so 2 outputs in total.

   );

  end component;

   signal C : std_logic_vector(2 downto 0); --Internal signals within the ripple adder (there's 3 of them) which is C(0), C(1), and C(2) because in the ripple adder, each of them act as both inputs and outputs

  begin 

    FA0: full_adder 
      
      port map (   --entire components representation of specifically full adder 0 (full adder A of the diagram) as one part of the ripple adder
    
            a => A(0),          -- This maps component a of a full adder to A(0) as one input of full adder 0
            b => not B(0),          -- This maps component b of a full adder to B(0) as one input of full adder 0
            c_in => C_in,       -- This maps component c_in of a full adder to C_in as one input of full adder 0
            s => S(0),          -- This maps component s of a full adder to S(0) as one output of full adder 0
            c_out => C(0)       -- This maps component c_out of a full adder to C(0) as one output of full adder 0

     );

    FA1: full_adder 
      
      port map (  --entire components representation of specifically full adder 1 (full adder A of the diagram) as one part of the ripple adder
  
            a => A(1),         -- This maps component a of a full adder to A(1) as one input of full adder 1
            b => not B(1),         -- This maps component b of a full adder to B(1) as one input of full adder 1
            c_in => C(0),      -- This maps component c_in of a full adder to C(0) as one input of full adder 1
            s => S(1),         -- This maps component s of a full adder to S(1) as one output of full adder 1
            c_out => C(1)      -- This maps component c_out of a full adder to C(1) as one output of full adder 1

      );

  
   FA2: full_adder 
     
     port map (  --entire components representation of specifically full adder 1 (full adder A of the diagram) as one part of the ripple adder
      
            a => A(2),        -- This maps component a of a full adder to A(2) as one input of full adder 2
            b => not B(2),        -- This maps component b of a full adder to B(2) as one input of full adder 2
            c_in => C(1),     -- This maps component c_in of a full adder to C(1) as one input of full adder 2
            s => S(2),        -- This maps component s of a full adder to S(2) as one output of full adder 2
            c_out => C(2)     -- This maps component c_out of a full adder to C(2) as one output of full adder 2

    );

  FA3 : full_adder 
    
    port map (  --entire components representation of specifically full adder 1 (full adder A of the diagram) as one part of the ripple adder

            a => A(3),       -- This maps component a of a full adder to A(3) as one input of full adder 3
            b => not B(3),       -- This maps component b of a full adder to B(3) as one input of full adder 3
            c_in => C(2),    -- This maps component c_in of a full adder to C(2) as one input of full adder 3
            s => S(3),       -- This maps component s of a full adder to S(3) as one output of full adder 3
            c_out => C_out   -- This maps component c_out of a full adder to C(3) as one output of full adder 3

     );

end behavioural;
