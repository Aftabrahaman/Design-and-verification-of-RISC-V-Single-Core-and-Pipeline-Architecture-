`include "fetch.sv"
`include "decode.sv"
`include "memory.sv"
`include "execute.sv"
`include "writeback.sv"


module Pipeline_top(
input clk,rst);

///Declaration of Intermediate wires ////////////////////////////////////////////////////////////////////////

wire pcsrc,regwriteE,memwriteE,regwriteM,branchE,alusrcE,resultsrcE,resultsrcM,resultsrcW,regwriteW;
wire [2:0] alucontrolE;
wire[4:0] RdW,RdE,RdM;
wire [31:0] pctarget,instruction,pc,pc4,r1E,r2E,
imm_addrE,pcE,pc4E,pc4M,writedataM,resultM,pc4W,resultW,ReaddataW,ResultW;

////Module declaraition ////////////////////////////////////////////////////////////////////////////////

///////////fetch stage 

fetch fetch_dut(.clk(clk),.rst(rst),.pcsrc(pcsrc), 
.pctarget(pctarget),
.instruction(instruction),.pc(pc),.pc4(pc4));

/////decoding stage 

decode decode_dut(
.clk(clk),.rst(rst),
 .instructd(instruction),.pcd(pc),.pc4d(pc4),.RdW(RdW),.regwriteW(regwriteW),
.regwriteE(regwriteE),.memwriteE(memwriteE),.branchE(brachE),
.alusrcE(alusrcE), .resultsrcE(resultsrcE),
.alucontrolE(alucontrolE), .r1E(r1E),.r2E(r2E),
.RdE(RdE),.imm_addrE(imm_addrE), .pcE(pcE),.pc4E(pc4E),.ResultW(ResultW));

////Execute Stage 

execute execute_dut( .clk(clk),.rst(rst),
.regwriteE(regwriteE),.memwriteE(memwriteE),
.branchE(branchE),.alusrcE(alusrcE), .resultsrcE(resultsrcE),
.alucontrolE(alucontrolE),
.r1(r1E),.r2(r2E),.imm_addrE(imm_addrE),.RdE(RdE),
.pcE(pcE),.pc4E(pc4E), .pctargetE(pctarget),.resultM(resultM),
.writedataM(writedataM),.RdM(RdM),.pc4M(pc4M),
.regwriteM(regwriteM),.memwriteM(memwriteM),.resultsrcM(resultsrcM),.pcsrcE(pcsrc));


/////Memory Stage 


memory memory_dut(
.clk(clk),.rst(clk),.pctargetE(),
.resultM(resultM),.writedataM(writedataM),.RdM(RdM),.pc4M(pc4M),
.regwriteM(regwriteM),.memwriteM(memwriteM),.resultsrcM(resultsrcM),.pcsrcE(pcsrc),
.regwriteW(regwriteW), .resultsrcW(resultsrcW),.RdW(RdW),
.pc4W(pc4W),.resultW(resultW),.ReaddataW(ReaddataW));


//////Write_Back Stage 

writeback writeback_dut(
.clk(clk),.rst(rst),
.resultsrcW(resultsrcW),
.pc4W(pc4W),.resultW(resultW),.ReaddataW(ReaddataW),
.ResultW(ResultW));

endmodule