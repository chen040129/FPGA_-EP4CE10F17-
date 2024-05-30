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
	output clk_out
);



wire [7:0]AD9481_data;
wire CLK_125M;
reg [13:0] DA_OUT;

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


always @(posedge CLK_250M)begin//读取AD9481的数据
	if(!RST_n)
	begin
		PDN<=1'b0;
		AD9481_data_reg<=8'b0;
	end
	else
	begin
		PDN<=1'b0;
		AD9481_data_reg[7:0]<=AD9481A_data[7:0];
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
		DA_9764_outB[13]<=~clk_out;
	end
end


	FIR_0002 fir_inst (
		.clk              (CLK_250M),              //                     clk.clk
		.reset_n          (RST_n),          //                     rst.reset_n
		.ast_sink_data    (ast_sink_data),    //   avalon_streaming_sink.data
		.ast_sink_valid   (ast_sink_valid),   //                        .valid
		.ast_sink_error   (ast_sink_error),   //                        .error
		.ast_source_data  (ast_source_data),  // avalon_streaming_source.data
		.ast_source_valid (ast_source_valid), //                        .valid
		.ast_source_error (ast_source_error)  //                        .error
	);

assign DA_CLKA=CLK_125M;
assign DA_CLKB=CLK_125M;

endmodule