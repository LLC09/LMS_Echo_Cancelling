// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Mar 16 12:43:47 2024
// Host        : DESKTOP-BI92BUO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/LorenzoLLC/DSP_project/DSP_LMS_Algorithm/DSP_LMS_Algorithm.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xa7a15tcpg236-1I
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_ila, clk_adc, reset, locked, clk_in)
/* synthesis syn_black_box black_box_pad_pin="clk_ila,clk_adc,reset,locked,clk_in" */;
  output clk_ila;
  output clk_adc;
  input reset;
  output locked;
  input clk_in;
endmodule
