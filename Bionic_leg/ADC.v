// ============================================================================
// Copyright (c) 2017 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Tue Nov 21 13:54:58 2017
// ============================================================================

//`define ENABLE_DDR3
//`define ENABLE_GPIO
//`define ENABLE_PCIE

module ADC(

      ///////// CLOCK /////////
      input              CLOCK_50_B3B,
      input              CLOCK_50_B4A, //Clock in DDR3's Bank
      input              CLOCK_50_B5B,
      input              CLOCK_50_B6A,
      input              CLOCK_50_B7A,
      input              CLOCK_50_B8A,

      ///////// Buttons /////////
      input              CPU_RESET_n, //RESET_n is Low-Active
      input    [ 3: 0]   KEY, //KEY is Low-Active

      ///////// Swtiches /////////
      input    [ 3: 0]   SW,

      ///////// LED /////////
      output   [ 3: 0]   LED, //LED is High-Active

      ///////// HEX0 /////////
      output             HEX0_DP,
      output   [ 6: 0]   HEX0,

      ///////// HEX1 /////////
      output             HEX1_DP,
      output   [ 6: 0]   HEX1,

      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// DRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_n,
      output             DRAM_WE_n,
      output             DRAM_CAS_n,
      output             DRAM_RAS_n,

`ifdef ENABLE_DDR3
      ///////// DDR3 /////////
      output   [14: 0]   DDR3_ADDR,
      output   [ 2: 0]   DDR3_BA,
      output             DDR3_CK_p,
      output             DDR3_CK_n,
      output             DDR3_CKE,
      inout    [ 3: 0]   DDR3_DQS_p,
      inout    [ 3: 0]   DDR3_DQS_n,
      inout    [31: 0]   DDR3_DQ,
      output   [ 3: 0]   DDR3_DM,
      output             DDR3_CS_n,
      output             DDR3_WE_n,
      output             DDR3_CAS_n,
      output             DDR3_RAS_n,
      output             DDR3_RESET_n,
      output             DDR3_ODT,
      input              DDR3_RZQ,
`endif /*ENABLE_DDR3*/

      ///////// Uart to Usb /////////
      output             UART_TX,
      input              UART_RX,
      input              UART_CTS,
      output             UART_RTS,

`ifdef ENABLE_GPIO
      ///////// GPIO /////////
      inout    [35: 0]   GPIO_0,
      inout    [35: 0]   GPIO_1,
`endif /*ENABLE_GPIO*/

      ///////// Arduino Interface /////////
      output             ADC_SCK,
      input              ADC_SDO,
      output             ADC_SDI,
      output             ADC_CONVST,
      inout    [15: 0]   ARD_IO,

`ifdef ENABLE_PCIE
      ///////// PCIE /////////
      inout              PCIE_SMBCLK,
      inout              PCIE_SMBDAT,
      input              PCIE_REFCLK_p,
      output   [ 3: 0]   PCIE_TX_p,
      input    [ 3: 0]   PCIE_RX_p,
      inout              PCIE_PERST_n,
      inout              PCIE_WAKE_n,
`endif /*ENABLE_PCIE*/

      ///////// SMA /////////
      input              SMA_CLKIN,
      output             SMA_CLKOUT 

);


//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================


arduino_adc u0(
		.adc_ltc2308_conduit_end_CONVST(ADC_CONVST), // adc_ltc2308_conduit_end.CONVST
		.adc_ltc2308_conduit_end_SCK(ADC_SCK),    //                        .SCK
		.adc_ltc2308_conduit_end_SDI(ADC_SDI),    //                        .SDI
		.adc_ltc2308_conduit_end_SDO(ADC_SDO),    //                        .SDO
		.clk_clk(CLOCK_50_B3B),                        //                     clk.clk
		.motor_export(LED),                     //                     led.export
		.reset_reset_n(CPU_RESET_n),                  //                   reset.reset_n
		.uart_rxd(UART_RX),
		.uart_txd(UART_TX),
	);


assign  FAN_CTRL = 1;

endmodule
