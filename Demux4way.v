`ifndef _DEMUX4WAY
`define _DEMUX4WAY
`include "Demux.v"
`include "And.v"
`include "Not.v"

module Demux4way(in, select, outA, outB, outC, outD);
    input  wire in;
    input  wire [1:0] select;
    output wire outA;
    output wire outB;
    output wire outC;
    output wire outD;

    wire notsel1;
    wire inAB;
    wire inCD;

    Not notin(.out(notsel1), .in(select[1]));
    And andAB(.out(inAB), .inA(in), .inB(notsel1));
    And andCD(.out(inCD), .inA(in), .inB(select[1]));

    Demux demuxAB(.in(inAB), .select(select[0]), .outA(outA), .outB(outB));
    Demux demuxCD(.in(inCD), .select(select[0]), .outA(outC), .outB(outD));
endmodule
`endif
