module extend(
input [31:0] extend_in,input [1:0]  immsrc,
output [31:0] extend_out);

assign extend_out=(immsrc==2'b01) ? {{20{1'b0}},extend_in[31:25],extend_in[11:7]} : (immsrc==2'b00)  ? (extend_in[31]) ? 
			{{20{1'b1}},extend_in[31:20]} : {{20{1'b0}},extend_in[31:20]} : {32{1'b0}};

endmodule 

