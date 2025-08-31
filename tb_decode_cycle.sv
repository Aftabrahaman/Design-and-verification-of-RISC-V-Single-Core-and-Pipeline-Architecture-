`timescale 1ns/1ps 
module tb();
logic  clk,rst;
logic[31:0] instructd,pcd,pc4d;
logic  regwriteE,memwriteE,branchE,alusrcE, resultsrcE;
logic  [2:0] alucontrolE;
logic  [4:0] RdE;
logic  [31:0] pcE,pc4E;

decode decode_duty(.clk(clk),.rst(rst),.instructd(instructd),.pcd(pcd),.pc4d(pc4d),.regwriteE(regwriteE),.memwriteE(memwriteE),.branchE(branchE)
			,.alusrcE(alusrcE),.resultsrcE(resultsrcE),.alucontrolE(alucontrolE),.RdE(RdE),.pcE(pcE),.pc4E(pc4E));

initial begin
clk=0;
rst=0;
end

always #10 clk=~clk;

initial begin
#20;
instructd=32'h00000003;
pcd=0;
pc4d=0;
#300;
$finish();
end

initial begin
$dumpfile("fetch.vcd");
$dumpvars;
end

endmodule 
