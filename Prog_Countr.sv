module Prog_C(
input clk,rst,
input [31:0] pc_next,
output reg [31:0] pc);

always@(posedge clk) begin
	if (rst==1'b0)
pc<=32'h00000000;
	else 
pc<=pc_next;
end

endmodule 
