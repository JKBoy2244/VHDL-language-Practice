<img width="795" height="402" alt="image" src="https://github.com/user-attachments/assets/a44122d5-992c-4c70-91a2-50898f0f46ea" />


This is a logic diagram example consisting of multiple logic gates within one diagram. 

-Inputs: A, B and Ci (Ci represents the carry input)

-Outputs: S and Co

-Signals: X, Y, Z (ones that consist of both inputs and outputs)

We focus on one output at a time.

Co:-This represents the carry output. 

   -It consists of an OR gate where the OR gate consists of 2 AND gates and one of the AND gates is joined by the 1st XOR gate.
    
   -Let's focus on the first AND gate where it consists of A and B. We'll use output Y here as the signal so hence, Y = (A and B).
    
   -The second AND gate consists of Ci (shown by the straight line) and at the junction point from the second AND gate consists of
   the 1st XOR gate deduced earlier which was X (A xor B)
    
   -We use output Z which is Z = (X and Ci). In other words Z = ((A xor B) and Ci)
    
   -Now the OR gate leading to Co consists of 2 AND gates with their outputs of Y and Z. Hence, Co = Y or Z
                                                                                                  Co = (A and B) or ((A xor B) and Ci)



S: -This represents the sum 

   -It consists of an XOR gate which also contains another XOR gate and Ci too indicated by the junction point 
    where it either goes to that second XOR gate or straight to the second AND gate

   -1st XOR gate consists of A and B as outputs so let's use output X. Hence, X = (A xor B).
   
   -2nd XOR gate leading to S consists of 2 inputs where 1 input is X and the other input is Ci
   
   -Hence as a result, we can deduce that S = (X xor Ci)
                                          S = ((A xor B) xor Ci) - in other words.


<img width="407" height="467" alt="image" src="https://github.com/user-attachments/assets/50749c0a-e078-4623-96d3-b7bcd9b36abb" />



Above is the truth table for that circuit.
                                          

