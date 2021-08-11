# HOMEWORK 1

---

## PROBLEM  1

### Figure
![Problem1 figure](<./problem1.jpg>)

## PROBLEM  2
### Code
* Problem2.v

  ```verilog
  `timescale 1ns / 1ps 
  //Problem 2 Homework #1 summer 2021 HUST 
  module p2hw1summer2021HUST(input I1,I2,I3,I4,output Straight,Tum)
      wire NotOut,OUT1,OUT3,OUT4;
      not U1(NotOut,I2);
      nand U2(OUT1,NotOut,I1);
      nor U3(OUT3,I3,I4);
      nand U4(OUT4,I3,I4);
      and U5(Straight,OUT1,OUT3);
      not U6(Tum,OUT4);
  endmodule
  ```

## PROBLEM  3
### Code
* MultiplierBehavior.v
```verilog
module MultiplierBehavior(
    input [1:0] A,B,
    output reg [2:0] Product
);
    always @(A,B) begin
        Product = A * B;
    end
endmodule
```
* MultiplierExpression.v
```verilog
module MultiplierExpression(
    input [1:0] A,B,
    output reg [2:0] Product
);
    assign Product[2] = (A[1]&(!A[0])&B[1]) | (A[1]&B[1]&(!B[0]));
    assign Product[1] = ((!A[1]&A[0]&B[1]) | (A[0]&B[1]&(!B[0])) | (A[1]&(!A[0])&B[0]) | (A[1]&(!B[1])&B[0]));
    assign Product[0] = A[0] & B[0];
endmodule
```

* MultiplierGates.v
```verilog
module MultiplierGates(
    input [1:0] A,B,
    output reg [2:0] Product
);
    or P2(Product[2], (A[1]&(!A[0])&B[1]), (A[1]&B[1]&(!B[0])));
    or P1(Product[1], (!A[1]&A[0]&B[1]), (A[0]&B[1]&(!B[0])), (A[1]&(!A[0])&B[0]), (A[1]&(!B[1])&B[0]));
    and P0(Product[0], A[0], B[0]);
endmodule
```

* MultiplierTruthTable.v

```verilog
module MultiplierTruthTable(
    input [1:0] A,B,
    output reg [2:0] Product
);
    always @(A,B) begin
        case ({A,B})
            4'b0000: Product = 3'b000;
            4'b0001: Product = 3'b000;
      		4'b0010: Product = 3'b000;
      		4'b0011: Product = 3'b000;
      		4'b0100: Product = 3'b000;
      		4'b0101: Product = 3'b001;
      		4'b0110: Product = 3'b010;
      		4'b0111: Product = 3'b011;
      		4'b1000: Product = 3'b000;
     		4'b1001: Product = 3'b010;
      		4'b1010: Product = 3'b100;
      		4'b1011: Product = 3'b110;
      		4'b1100: Product = 3'b000;
      		4'b1101: Product = 3'b011;
      		4'b1110: Product = 3'b110;
      		4'b1111: Product = 3'b001;
        endcase
    end
endmodule
```
* p3hw1TestFixture.v
```verilog
`timescale 1ns / 1ps
//Multiplier test bench 
module p3hw1TestFixture; 
reg A[1:0], B[1:0]; 
wire ProductBgates[2:0], ProductExpressions [2:0], ProductTruthTable[2:0], 
ProductBbehavior[2:0]; 
//insert four circuits 
initial begin
A[0]=0;A[1]=0; B[0]=0;B[1]=0; #10;
A[0]=0;A[1]=0; B[0]=1;B[1]=0; #10;
A[0]=0;A[1]=0; B[0]=0;B[1]=1; #10;
A[0]=0;A[1]=0; B[0]=1;B[1]=1; #10;

A[0]=1;A[1]=0; B[0]=0;B[1]=0; #10;
A[0]=1;A[1]=0; B[0]=1;B[1]=0; #10;
A[0]=1;A[1]=0; B[0]=0;B[1]=1; #10;
A[0]=1;A[1]=0; B[0]=1;B[1]=1; #10;

A[0]=1;A[1]=1; B[0]=0;B[1]=0; #10;
A[0]=1;A[1]=1; B[0]=1;B[1]=0; #10;
A[0]=1;A[1]=1; B[0]=0;B[1]=1; #10;
A[0]=1;A[1]=1; B[0]=1;B[1]=1; #10;

A[0]=0;A[1]=1; B[0]=0;B[1]=0; #10;
A[0]=0;A[1]=1; B[0]=1;B[1]=0; #10;
A[0]=0;A[1]=1; B[0]=0;B[1]=1; #10;
A[0]=0;A[1]=1; B[0]=1;B[1]=1; #10;
end

MultiplierBehavior Unit1({A[1],A[0]},{B[1],B[0]},{ProductBbehavior[2],ProductBbehavior[1],ProductBbehavior[0]});
MultiplierExpression Unit2({A[1],A[0]},{B[1],B[0]},{ProductExpressions[2],ProductExpressions[1],ProductExpressions[0]});
MultiplierGates Unit3({A[1],A[0]},{B[1],B[0]},{ProductBgates[2],ProductBgates[1],ProductBgates[0]});
MultiplierTruthTable Unit4({A[1],A[0]},{B[1],B[0]},{ProductTruthTable[2],ProductTruthTable[1],ProductTruthTable[0]});

//generate test patterns 
endmodule
```
### Figure
#### Schematic
* MultiplierBehavior
![Problem3 figure](<./problem3_MultiplierBehavior_schematic.jpg>)
* MultiplierExpression
![Problem3 figure](<./problem3_Multiplier_Expression.jpg>)
* MultiplierGates
![Problem3 figure](<./problem3_Multiplier_Gates.jpg>)
* MultiplierTruthTable
![Problem3 figure](<./problem3_Multiplier_TruthTable.jpg>)
* Waveforms
![Problem3 figure](<./problem3_waveforms.jpg>)
* Table and Logic Expression
![Problem3 figure](<./problem3_table.jpg>)
## PROBLEM  4

### 4.(a)
* B;Active low
### 4.(b)
* A;Active high;Asynchronous
### 4.(c)
* C;Active low;Synchronous

## PROBLEM  5
![Problem5 figure](<./problem5.jpg>)
## PROBLEM  6
![Problem6 figure](<./problem6.jpg>)

## PROBLEM  7
### Code
* hw1p7summer2020HUSTdetect11010.v
```verilog
`timescale 1ns / 100ps   
// File name : hw1p7summer2020HUSTdetect11010.v   
// Cunyang Liu  
// Summer 2021 HUST   
// Problem 7, Homework #1, summer 2021   
// Detect sequence of 11010 recursively.   
module hw1p5summer20201HUSTdetect11010(input InputBit, CLK, Reset, output reg Detected11010);   
// State variables   
reg [2:0] CurrentState, NextState;   
// State codes   
parameter SInitial = 3'd0,S1 = 3'd1, S11 = 3'd2, S110= 3'd3, S1101=3'd4, S11010=3'd5;
    
always @ (posedge CLK or negedge Reset)   
begin  
if (!Reset)  
  CurrentState <= SInitial;  
else  
  CurrentState <= NextState;  
end  
  
always @ (*) begin  
case (CurrentState)  
  SInitial:   
    if (InputBit == 1)
        NextState <= S1;  
    else
        NextState <= SInitial;  
  S1:  
    if (InputBit == 1)
        NextState <= S11;  
    else
        NextState <= SInitial;  
  S11:  
    if (InputBit == 1)
        NextState <= S11;
    else
        NextState <= S110;  
  S110:   
    if (InputBit == 1)
        NextState <= S1101;  
    else
        NextState <= SInitial;  
  S1101:   
    if (InputBit == 1)
        NextState <= S11;  
    else
        NextState <= S11010;  
  S11010:   
    if (InputBit == 1)
        NextState <= S1;  
    else
        NextState <= SInitial;  
  default:  
        NextState <= SInitial;  
endcase  
end  
  
//the output depends on the current state  
always @ (*) begin
    if (CurrentState == S11010) 
        Detected11010 <= 1;
    else
        Detected11010 <= 0;
end    
endmodule
```
* hw1p7summer2021HUSTdetect11010_tb.v
```verilog
`timescale 1ns / 1ps
//Summer 2021 HUST
module hw1p7summer2021HUSTdetect11010_tb;   
reg x, clk, reset;   
wire detected;   
wire [2:0] CurrentState=Unit1.CurrentState;
  
always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 0;
        x = 0;  
        #6 reset=1;
        #6 x=1;  
  		#10 x = 1;  
  		#10 x = 0;  
        #10 x = 1;  
        #10 x = 0;  
        #10 x = 1;  
        #10 x = 1;  
        #10 x = 1;  
        #10 x = 0;  
        #10 x = 1;  
        #10 x = 1;  
        #10 x = 0;  
        #10 x = 1;  
        #10 x = 0;  
        #10 x = 0;  
        #10 x = 1;  
        #10 x = 1;  
        #10 x = 0;  
        #10 x = 1;  
        #10 x = 0;
    end
    hw1p5summer20201HUSTdetect11010 Unit1(x, clk, reset,detected);  
endmodule  
```
### Figure

* problem7_RTL_schematic
![Problem7 figure](<./problem7_RTL_schematic.jpg>)
* problem7_waveform
![Problem7 figure](<./problem7_waveform.jpg>)
## PROBLEM  8

