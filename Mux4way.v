// Output will be A if select is 0 and B if select is 1
`ifndef _MUX4WAY
`define _MUX4WAY
`include "Mux.v"

module Mux4way(out, select, inA, inB, inC, inD);
    output wire out;
    input  wire [1:0] select;
    input  wire inA;
    input  wire inB;
    input  wire inC;
    input  wire inD;

    wire abOut;
    wire cdOut;

    Mux muxab(.out(abOut), .select(select[0]), .inA(inA), .inB(inB));
    Mux muxcd(.out(cdOut), .select(select[0]), .inA(inC), .inB(inD));

    Mux muxab_cd(.out(out), .select(select[1]), .inA(abOut), .inB(cdOut));

endmodule
`endif
// sel a b c d out
// 00           a
// 01           b
// 10
// 11