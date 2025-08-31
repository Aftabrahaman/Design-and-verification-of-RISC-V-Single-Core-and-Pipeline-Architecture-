
module register(
input clk,rst,
input [4:0] a1,a2,a3,
input we,
input [31:0] wd,
output [31:0] r1,r2);

///////buiding the register memory
reg [31:0] register [0:31];

assign r1=(!rst)?32'h00000000 : register[a1];
assign r2=(!rst)?32'h00000000 : register[a2];

always @(posedge clk)begin
if(we)
register[a3] <=wd;
end

endmodule



