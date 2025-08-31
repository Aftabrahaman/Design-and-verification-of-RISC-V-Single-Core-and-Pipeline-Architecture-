`include "Mux.sv"

module writeback(
input clk,rst,
input resultsrcW,
input [31:0] pc4W,resultW,ReaddataW,
output [31:0] ResultW);

mux mux_dut(.a(resultW),.b(ReaddataW),.s(resultsrcW),.c(ResultW));

endmodule
 