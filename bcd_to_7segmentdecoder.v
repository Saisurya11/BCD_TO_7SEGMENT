module bcd_to_sevensegment_decoder(A,B,C,D,E,out,CC,CA);
input A,B,C,D,E,CC,CA;
output reg [7:0]out=0;
always@(*)
begin
if(CC && !CA && E)//COMMON CATHODE==1
begin
case({A,B,C,D})
4'b0000:out[7:0]=8'hFC;
4'b0001:out[7:0]=8'h60;
4'b0010:out[7:0]=8'hDA;
4'b0011:out[7:0]=8'hF2;
4'b0100:out[7:0]=8'h66;
4'b0101:out[7:0]=8'hB6;
4'b0110:out[7:0]=8'hBE;
4'b0111:out[7:0]=8'hE0;
4'b1000:out[7:0]=8'hFE;
4'b1001:out[7:0]=8'hF6;
default:out[7:0]=8'hFF;
endcase
end
else if(CA && !CC && E)
begin
case({A,B,C,D})
4'b0000:out[7:0]=8'h03;
4'b0001:out[7:0]=8'h9F;
4'b0010:out[7:0]=8'h25;
4'b0011:out[7:0]=8'h0D;
4'b0100:out[7:0]=8'h99;
4'b0101:out[7:0]=8'h49;
4'b0110:out[7:0]=8'h41;
4'b0111:out[7:0]=8'h1F;
4'b1000:out[7:0]=8'h01;
4'b1001:out[7:0]=8'h09;
default:out[7:0]=8'h00;
endcase
end
else
out[7:0]=8'hFF; //common cathode all leds will be in on,Common Anode all  leds will be in off
end
endmodule

module test;
reg A,B,C,D,E,CC,CA;
wire [7:0]out;
bcd_to_sevensegment_decoder x1(A,B,C,D,E,out,CC,CA);
initial
begin
CC=1;CA=0;E=1;
A=0;B=0;C=0;D=0; #5
A=0;B=0;C=0;D=1; #5
A=0;B=0;C=1;D=0; #5
A=0;B=0;C=1;D=1; #5

A=0;B=1;C=0;D=0; #5
A=0;B=1;C=0;D=1; #5
A=0;B=1;C=1;D=0; #5
A=0;B=1;C=1;D=1; #5

A=1;B=0;C=0;D=0; #5
A=1;B=0;C=0;D=1; #5

CC=0;CA=1;
A=0;B=0;C=0;D=0; #5
A=0;B=0;C=0;D=1; #5
A=0;B=0;C=1;D=0; #5
A=0;B=0;C=1;D=1; #5

A=0;B=1;C=0;D=0; #5
A=0;B=1;C=0;D=1; #5
A=0;B=1;C=1;D=0; #5
A=0;B=1;C=1;D=1; #5

A=1;B=0;C=0;D=0; #5
A=1;B=0;C=0;D=1; #5

CC=1;CA=0;E=0;
A=0;B=0;C=0;D=0; #5
A=0;B=0;C=0;D=1; #5
A=0;B=0;C=1;D=0; #5
A=0;B=0;C=1;D=1; #5

A=0;B=1;C=0;D=0; #5
A=0;B=1;C=0;D=1; #5
A=0;B=1;C=1;D=0; #5
A=0;B=1;C=1;D=1; #5

A=1;B=0;C=0;D=0; #5
A=1;B=0;C=0;D=1; #5
$stop;
end
endmodule