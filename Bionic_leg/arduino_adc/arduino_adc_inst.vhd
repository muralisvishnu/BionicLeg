	component arduino_adc is
		port (
			adc_ltc2308_conduit_end_CONVST : out std_logic;                           -- CONVST
			adc_ltc2308_conduit_end_SCK    : out std_logic;                           -- SCK
			adc_ltc2308_conduit_end_SDI    : out std_logic;                           -- SDI
			adc_ltc2308_conduit_end_SDO    : in  std_logic                    := 'X'; -- SDO
			clk_clk                        : in  std_logic                    := 'X'; -- clk
			motor_export                   : out std_logic_vector(3 downto 0);        -- export
			pll_sys_locked_export          : out std_logic;                           -- export
			reset_reset_n                  : in  std_logic                    := 'X'; -- reset_n
			uart_rxd                       : in  std_logic                    := 'X'; -- rxd
			uart_txd                       : out std_logic                            -- txd
		);
	end component arduino_adc;

	u0 : component arduino_adc
		port map (
			adc_ltc2308_conduit_end_CONVST => CONNECTED_TO_adc_ltc2308_conduit_end_CONVST, -- adc_ltc2308_conduit_end.CONVST
			adc_ltc2308_conduit_end_SCK    => CONNECTED_TO_adc_ltc2308_conduit_end_SCK,    --                        .SCK
			adc_ltc2308_conduit_end_SDI    => CONNECTED_TO_adc_ltc2308_conduit_end_SDI,    --                        .SDI
			adc_ltc2308_conduit_end_SDO    => CONNECTED_TO_adc_ltc2308_conduit_end_SDO,    --                        .SDO
			clk_clk                        => CONNECTED_TO_clk_clk,                        --                     clk.clk
			motor_export                   => CONNECTED_TO_motor_export,                   --                   motor.export
			pll_sys_locked_export          => CONNECTED_TO_pll_sys_locked_export,          --          pll_sys_locked.export
			reset_reset_n                  => CONNECTED_TO_reset_reset_n,                  --                   reset.reset_n
			uart_rxd                       => CONNECTED_TO_uart_rxd,                       --                    uart.rxd
			uart_txd                       => CONNECTED_TO_uart_txd                        --                        .txd
		);

