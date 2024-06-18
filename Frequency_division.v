module Frequency_division(
	input CLK,
	input RST_n,
	input [7:0] AD9481A_data,
	input [7:0] AD9481B_data,
	output CLK_250M,
	output reg PDN,//adc掉电控制，高电平有效
	output reg [7:0] AD9481_data_reg,//接收数据的寄存器
	output reg [13:0] DA_9764_outA,
	output reg [13:0] DA_9764_outB,
	output DA_CLKA,
	output DA_CLKB,
	output clk_out,
	output[7:0] FIR_out
);



wire [7:0]AD9481_data;
wire CLK_125M;
reg [13:0] DA_OUT;

wire CLK_50M;
wire FIR_vaild;

CLK AD_DA(
	.inclk0 (CLK),
	.c0	  (CLK_125M),
	.c1	  (CLK_250M)
);

clk(
	.rst		(RST_n),
	.clk		(AD9481_data_reg[7]),
	.clk_out	(clk_out),
);
Effective_bit(
	.rst		(RST_n),
	.clk		(CLK_250M),
	.clk_out	(CLK_50M)
);

always @(posedge CLK_250M)begin//读取AD9481的数据
	if(!RST_n)
	begin
		PDN<=1'b0;
		AD9481_data_reg<=8'b0;
	end
	else
	begin
		PDN<=1'b0;
		AD9481_data_reg[7:0]<=AD9481A_data[7:0]-127;
	end
end


always @(posedge CLK_125M)begin//DA9764输出
	if(!RST_n)
	begin
		DA_9764_outA[13:0]<={8{1'b1}};
		DA_9764_outB[13:0]<={8{1'b1}};
	end
	else
	begin
	if(FIR_vaild)begin
		DA_9764_outA[13:6]<=~(FIR_out[7:0]+127);
	end
		DA_9764_outB[13]<=~clk_out;
	end
end


assign DA_CLKA=CLK_125M;
assign DA_CLKB=CLK_125M;
endmodule