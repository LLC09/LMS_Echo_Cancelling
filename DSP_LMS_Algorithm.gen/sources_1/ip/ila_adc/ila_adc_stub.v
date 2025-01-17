// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Mar 16 11:55:23 2024
// Host        : DESKTOP-BI92BUO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top ila_adc -prefix
//               ila_adc_ ila_adc_stub.v
// Design      : ila_adc
// Purpose     : Stub declaration of top-level module interface
// Device      : xa7a15tcpg236-1I
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2020.2" *)
module ila_adc(clk, probe0, probe1, probe2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[15:0],probe1[0:0],probe2[0:0]" */;
  input clk;
  input [15:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
endmodule
