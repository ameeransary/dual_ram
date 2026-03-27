`timescale 1ns / 1ps
module Ram_tb;
reg EN,CLK=0,Write_A,Write_B;
reg [15:0]data_A,data_B;
reg [3:0]Address_A, Address_B;
wire [15:0] Out_A,Out_B;
always #10 CLK=~CLK;
Ram dut(.EN(EN),.CLK(CLK),.Write_A(Write_A),.Write_B(Write_B),.data_A(data_A),.data_B(data_B),.Address_A(Address_A),.Address_B(Address_B),.Out_A(Out_A),.Out_B(Out_B));
integer i;
integer j;
initial begin
EN=0;Write_A=0;Write_B=0;data_A=0;data_B=0;Address_A=0; Address_B=0;
#10;
EN=1;Write_A=1;
for(i=0;i<5;i=i+1)
begin
@ (posedge CLK);
data_A<=$random%256;
Address_A=i;
end
@ (posedge CLK);
Write_B=1;
for(j=0;j<5;j=j+1)
begin
@(posedge CLK)
data_B<=$random%256;
Address_B=j;
end
@ (posedge CLK);
Write_A=0;
for(i=0;i<5;i=i+1)
begin
@(posedge CLK);
Address_A=i;
$display("Out_A=%0d",Out_A);
end
@ (posedge CLK);
Write_B=0;
for(j=0;j<5;j=j+1)
begin
@(posedge CLK);
Address_B=j;
$display("Out_B=%0d",Out_B);

end
#70 $finish;
end
endmodule


