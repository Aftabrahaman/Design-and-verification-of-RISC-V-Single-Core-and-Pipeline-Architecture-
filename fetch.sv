`include "Mux.sv"
`include "pc_adder.sv"
`include "Prog_Countr.sv"
`include "Instruction_mem.sv"

module fetch(
input clk,rst,
input pcsrc,
input [31:0] pctarget,
output[31:0] instruction,
pc,pc4);

wire [31:0] pc4_wire,pcnext_wire,pc_to_instruction_wire,instruct_reg_wire;
reg [31:0] instruction_reg,pc4_reg,pc_reg;

mux mux_to_pc(.a(pc4_wire),.b(pctarget),.s(pcsrc),.c(pcnext_wire));

pc_adder pc_adder_block(.a(pc_to_instruction_wire),.b(32'h00000004),.c(pc4_wire));

Prog_C prog_counter(.clk(clk),.rst(rst),.pc_next(pcnext_wire),.pc(pc_to_instruction_wire));

Inst_mem inst_mem(.rst(rst),.addr(pc_to_instruction_wire),.RD(instruct_reg_wire));

always@(posedge clk or negedge rst)begin
if(rst==1'b0)begin
instruction_reg<=32'h00000000;
pc4_reg<=32'h00000000;
pc_reg<=32'h00000000;
end
else begin
instruction_reg<=instruct_reg_wire;
pc4_reg<=pc4_wire;
pc_reg<=pc_to_instruction_wire;
end
end

assign instruction =(rst==1'b0) ? 32'h00000000 : instruction_reg;
assign pc=(rst==1'b0) ? 32'h00000000 : pc_reg;
assign pc4 = (rst==1'b0) ? 32'h00000000 : pc4_reg;

endmodule 




