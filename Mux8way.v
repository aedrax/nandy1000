// Output will be A if select is 0 and B if select is 1
`ifndef _MUX8WAY
`define _MUX8WAY
`include "Mux.v"
`include "Mux4way.v"

module Mux8way(out, select, inA, inB, inC, inD, inE, inF, inG, inH);
    output wire out;
    input  wire [2:0] select;
    input  wire inA;
    input  wire inB;
    input  wire inC;
    input  wire inD;
    input  wire inE;
    input  wire inF;
    input  wire inG;
    input  wire inH;

    wire abcdOut;
    wire efghOut;

    Mux4way muxabcd(.out(abcdOut), .select(select[1:0]), .inA(inA), .inB(inB), .inC(inC), .inD(inD));
    Mux4way muxdfgh(.out(efghOut), .select(select[1:0]), .inA(inE), .inB(inF), .inC(inG), .inD(inH));

    Mux result(.out(out), .select(select[2]), .inA(abcdOut), .inB(efghOut));

endmodule
`endif
