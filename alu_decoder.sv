module alu_decoder(
input [1:0] aluop,
input op5,funct7,
input [2:0] funct3,
output [2:0] alucontrol);

wire [1:0] concatenation = {op5, funct7};

assign alucontrol=(aluop==2'b00) ? 3'b000 : (aluop==2'b01) ? 3'b001 : ((aluop==2'b10) & (funct3==3'b010) ) ? 3'b101 : 
((aluop==2'b10) & (funct3==3'b110)) ? 3'b011 : ((aluop==2'b10) & (funct3==3'b111)) ? 3'b010 : 
((aluop==2'b10) & (funct3==3'b000) &(concatenation==2'b11) ) ? 3'b011 : ((aluop==2'b10) & (funct3==3'b000) &(concatenation!==2'b11) )? 3'b000 :3'b000; 

endmodule 
