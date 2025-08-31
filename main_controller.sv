`include "main_decoder.sv"
`include "alu_decoder.sv"


module main_control_top(
input [6:0] op , funct7,
input [2:0] funct3,
output resultsrc ,memwrite ,regwrite,alusrc,branch,
output[1:0] imsrc,
output [2:0] alucontrol);

wire [1:0] aluop;


main_decoder main(.op(op),.resultsrc(resultsrc),.memwrite(memwrite),.alusrc(alusrc),.regwrite(regwrite),
		.imsrc(imsrc),.branch(branch),.aluop(aluop));
alu_decoder alu(.aluop(aluop),.funct3(funct3),.funct7(funct7[5]),.op5(op[5]),.alucontrol(alucontrol));

endmodule 

