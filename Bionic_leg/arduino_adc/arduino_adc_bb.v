
module arduino_adc (
	adc_ltc2308_conduit_end_CONVST,
	adc_ltc2308_conduit_end_SCK,
	adc_ltc2308_conduit_end_SDI,
	adc_ltc2308_conduit_end_SDO,
	clk_clk,
	motor_export,
	pll_sys_locked_export,
	reset_reset_n,
	uart_rxd,
	uart_txd);	

	output		adc_ltc2308_conduit_end_CONVST;
	output		adc_ltc2308_conduit_end_SCK;
	output		adc_ltc2308_conduit_end_SDI;
	input		adc_ltc2308_conduit_end_SDO;
	input		clk_clk;
	output	[3:0]	motor_export;
	output		pll_sys_locked_export;
	input		reset_reset_n;
	input		uart_rxd;
	output		uart_txd;
endmodule
