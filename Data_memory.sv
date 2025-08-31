module data_mem(
input clk,we,rst,
input [31:0] addr, wd,
output reg [31:0] RD);

reg [31:0] data_mem[31:0];
integer i;

//assign RD=(!rst)? 32'h00000000 : data_mem[aadr];

always @(posedge clk)begin
if(!rst)begin
for (i=0;i<=31;i=i+1)begin
data_mem[i]<=32'h00000000;
end
end
else if(we)
data_mem[addr]<=wd;
else 
RD<=data_mem[addr];
end
endmodule 
