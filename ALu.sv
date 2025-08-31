module alu(
input [31:0] a,b,
input [2:0] alucontroll,
output carry ,overflow ,zero, negative ,
output [31:0] result );

///////////////////////declaring interm wires ////////////
wire [31:0] a_and_b;
wire [31:0] a_or_b;
wire [31:0] not_b;
wire [31:0] mux_1;
wire cout ;
wire [31:0] sum;
wire [31:0] mux_2;
wire [31:0] slt; 

////////////////Logic Design //////////////////////

assign a_and_b = a&b;
assign a_or_b = a | b;
assign not_b = ~b;
assign mux_1 = (alucontroll[0] == 1'b0) ? b : not_b;

//////// addition / substraction operation ///////

assign sum = a + mux_1 + alucontroll[0] ;

///////////////// Zero Extension ////////////////////////////

assign slt = {31'b0000000000000000000000000000000,sum[31]};

////// Designing 4*1 Mux ///////////////////

assign mux_2 = (alucontroll[2:0] == 3'b000) ? sum : (alucontroll[2:0] == 3'b001) ? sum : (alucontroll[2:0] == 3'b010) ? a_and_b : (alucontroll[2:0] == 3'b011) ? a_or_b : (alucontroll[2:0] == 3'b101) ?slt : 32'h00000000 ;

assign result = mux_2;

 /* assign {cout,result }=((alucontroll==3'b000) | (alucontroll==3'b001)) ? sum : (alucontroll==3'b010) ? a&b : (alucontroll==3'b011) ? a|b :
(alucontroll==3'b101) ? {{32{1'b0}},sum[31]} : {33{1'b0}}; */

assign overflow = (~alucontroll[1]) & (a[31] ^ sum[31]) & (~(a[31]^b[31] ^ alucontroll[0]));
assign zero =&(~result);
assign negative=result[31];
assign carry = (~alucontroll[1]) &cout;

endmodule 
