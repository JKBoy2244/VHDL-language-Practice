<img width="931" height="440" alt="image" src="https://github.com/user-attachments/assets/02e2d4bc-74fd-4cca-ae48-3328fc436e57" />

--------------------------------------------------------------------------------------------------------------------------

- This diagram looks really hard as it consists of multiple full-adders joined together but if you think about 1 full adder on it's own, it's basically 4 sets of full adders but all joined together.
  
- So the theory behind this is pretty much the same here anyways.

- For this diagram, let's first find all the inputs, outputs and the signals for each adder individually

   Full Adder A:  inputs: C_in, A0, A0
  
                  outputs: C0, S0

   Full Adder B:  inputs: C0, A1, B1
  
                  outputs: C1, S1

   Full Adder C:  inputs: C1, A2, B2
  
                  outputs: C2, S2

   Full Adder D:  inputs: C2, A3, B3
  
                  outputs: C3, S3


- When listing all the inputs and outputs for all 4 adders, some components act as both inputs and outputs which are C0, C1 and C2

  They are the signals of the program
