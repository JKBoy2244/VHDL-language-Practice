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

- From the adders code I added, we already know that S = ((A xor B) xor C_in) normally

- From the adders code I added, we already know that C_out = (A and B) or ((A xor B) and C_in) normally

- Using the 2 bullet points directly above this one, we can deduce things quite quickly as the diagram is drawn in some sort of pattern

    S0 = ((A0 xor B0) xor C_in)      ,         C0 = (A0 and B0) or ((A0 xor B0) and C_in)      --> Full Adder A
  
    S1 = ((A1 xor B1) xor C0)       ,          C1 = (A1 and B1) or ((A1 xor B1) and C0)        --> Full Adder B
  
    S2 = ((A2 xor B2) xor C1)       ,          C2 = (A2 and B2) or ((A2 xor B2) and C1)        --> Full Adder C
  
    S3 = ((A3 xor B3) xor C2)       ,          C3 = (A3 and B3) or ((A3 xor B3) and C2)        --> Full Adder D
