`timescale 1ns / 1ps

module Ram(
input EN, CLK, Write_A, Write_B,
input [15:0] data_A, data_B,
input [3:0] Address_A, Address_B,
output reg [15:0] Out_A, Out_B);
reg [15:0] ram [15:0];
initial
begin
Out_A <= 0;
Out_B <= 0;
end
always @(posedge CLK) 
begin
if (EN) 
begin
if (Write_B && !(Write_A && Address_A == Address_B)) 
//if (Write_A)
ram[Address_B] <= data_B;
else
Out_B <= ram[Address_B];
end
end
always @(posedge CLK) 
begin
if (EN) begin
if (Write_A)
ram[Address_A] <= data_A;
else
Out_A <= ram[Address_A];
end
end
endmodule

