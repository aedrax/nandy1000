// Output will be A if select is 0 and B if select is 1
`ifndef _MUX4WAY16bit
`define _MUX4WAY16bit
`include "Mux4way8bit.v"

module Mux4way16bit(out, select, inA, inB, inC, inD);
    output wire [15:0] out;
    input  wire [1:0] select;
    input  wire [15:0] inA;
    input  wire [15:0] inB;
    input  wire [15:0] inC;
    input  wire [15:0] inD;

    Mux4way8bit bit0_7(.out(out[7:0]), .select(select), .inA(inA[7:0]), .inB(inB[7:0]), .inC(inC[7:0]), .inD(inD[7:0]));
    Mux4way8bit bit8_15(.out(out[15:8]), .select(select), .inA(inA[15:8]), .inB(inB[15:8]), .inC(inC[15:8]), .inD(inD[15:8]));

endmodule
`endif
