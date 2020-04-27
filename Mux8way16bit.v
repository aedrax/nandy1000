// Output will be A if select is 0 and B if select is 1
`ifndef _MUX8WAY16bit
`define _MUX8WAY16bit
`include "Mux8way8bit.v"

module Mux8way16bit(out, select, inA, inB, inC, inD, inE, inF, inG, inH);
    output wire [15:0] out;
    input  wire [2:0] select;
    input  wire [15:0] inA;
    input  wire [15:0] inB;
    input  wire [15:0] inC;
    input  wire [15:0] inD;
    input  wire [15:0] inE;
    input  wire [15:0] inF;
    input  wire [15:0] inG;
    input  wire [15:0] inH;

    Mux8way8bit bit0_7(.out(out[7:0]), .select(select),
                       .inA(inA[7:0]), .inB(inB[7:0]), .inC(inC[7:0]), .inD(inD[7:0]),
                       .inE(inE[7:0]), .inF(inF[7:0]), .inG(inG[7:0]), .inH(inH[7:0]));
    Mux8way8bit bit8_15(.out(out[15:8]), .select(select),
                        .inA(inA[15:8]), .inB(inB[15:8]), .inC(inC[15:8]), .inD(inD[15:8]),
                        .inE(inE[15:8]), .inF(inF[15:8]), .inG(inG[15:8]), .inH(inH[15:8]));

endmodule
`endif
