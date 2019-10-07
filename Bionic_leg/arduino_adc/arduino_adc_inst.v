	arduino_adc u0 (
		.adc_ltc2308_conduit_end_CONVST (<connected-to-adc_ltc2308_conduit_end_CONVST>), // adc_ltc2308_conduit_end.CONVST
		.adc_ltc2308_conduit_end_SCK    (<connected-to-adc_ltc2308_conduit_end_SCK>),    //                        .SCK
		.adc_ltc2308_conduit_end_SDI    (<connected-to-adc_ltc2308_conduit_end_SDI>),    //                        .SDI
		.adc_ltc2308_conduit_end_SDO    (<connected-to-adc_ltc2308_conduit_end_SDO>),    //                        .SDO
		.clk_clk                        (<connected-to-clk_clk>),                        //                     clk.clk
		.motor_export                   (<connected-to-motor_export>),                   //                   motor.export
		.pll_sys_locked_export          (<connected-to-pll_sys_locked_export>),          //          pll_sys_locked.export
		.reset_reset_n                  (<connected-to-reset_reset_n>),                  //                   reset.reset_n
		.uart_rxd                       (<connected-to-uart_rxd>),                       //                    uart.rxd
		.uart_txd                       (<connected-to-uart_txd>)                        //                        .txd
	);

