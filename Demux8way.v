`ifndef _DEMUX8WAY
`define _DEMUX8WAY
`include "Demux4way.v"
`include "And.v"
`include "Not.v"

module Demux8way(in, select, outA, outB, outC, outD, outE, outF, outG, outH);
    input  wire in;
    input  wire [2:0] select;
    output wire outA;
    output wire outB;
    output wire outC;
    output wire outD;
    output wire outE;
    output wire outF;
    output wire outG;
    output wire outH;

    wire notsel2;
    wire inABCD;
    wire inEFGH;

    Not notin(.out(notsel2), .in(select[2]));
    And andAB(.out(inABCD), .inA(in), .inB(notsel2));
    And andCD(.out(inEFGH), .inA(in), .inB(select[2]));

    Demux4way demuxABCD(.in(inABCD), .select(select[1:0]), .outA(outA), .outB(outB), .outC(outC), .outD(outD));
    Demux4way demuxEFGH(.in(inEFGH), .select(select[1:0]), .outA(outE), .outB(outF), .outC(outG), .outD(outH));
endmodule
`endif
