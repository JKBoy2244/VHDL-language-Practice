<img width="501" height="722" alt="image" src="https://github.com/user-attachments/assets/242aaf9a-c831-40b0-b3af-23f387906e70" />

-----------------------------------------------------------------------------------------

-The above picture is an example of a 16x1 multiplexer which can be constructed using 4 4x1 multiplexers.
-When trying to code or run this multiplexer, we need to see what's going on a plus what's happening first. 



-Inputs: I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15
-Selects: S0, S1, S2, S3
-Output: F



-All 4 bottom multiplexers have selects: S0 and S1 and the top multiplexer has selects: S2 and S3

-I0 to I3 - inputs of 1st multiplexer

 I4 to I7 - inputs of 2nd multiplexer
 
 I8 to I11 - inputs of 3rd multiplexer
 
 I12 to I15 - inputs of 4th multiplexer

-However, let's create signals for this just to make the multiplexer diagram easier(outputs and inputs at the same time)

-O1 - output of 1st multiplexer

 O2 - output of 2nd multiplexer
 
 O3 - output of 3rd multiplexer
 
 O4 - output of 4th multiplexer
 
 (O means out like I means in)

-As a result of this, this concludes for the top multiplexer.

-Inputs: 01, 02, 03, 04
-Selects: S2, S3
-Output: F
