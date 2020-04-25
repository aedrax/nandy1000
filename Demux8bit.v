// Output will be on A if select is 0 and B if select is 1, otherwise 0
// |  in   |  sel  |  outA |  outB |
// |   0   |   0   |   0   |   0   |
// |   0   |   1   |   0   |   0   |
// |   1   |   0   |   1   |   0   |
// |   1   |   1   |   0   |   1   |
`ifndef _DEMUX8BIT
`define _DEMUX8BIT
`include "Demux.v"

module Demux8bit(in, select, outA, outB);
    input  wire [7:0] in;
    input  wire select;
    output wire [7:0] outA;
    output wire [7:0] outB;

    Demux bit0(.in(in[0]), .select(select), .outA(outA[0]), .outB(outB[0]));
    Demux bit1(.in(in[1]), .select(select), .outA(outA[1]), .outB(outB[1]));
    Demux bit2(.in(in[2]), .select(select), .outA(outA[2]), .outB(outB[2]));
    Demux bit3(.in(in[3]), .select(select), .outA(outA[3]), .outB(outB[3]));
    Demux bit4(.in(in[4]), .select(select), .outA(outA[4]), .outB(outB[4]));
    Demux bit5(.in(in[5]), .select(select), .outA(outA[5]), .outB(outB[5]));
    Demux bit6(.in(in[6]), .select(select), .outA(outA[6]), .outB(outB[6]));
    Demux bit7(.in(in[7]), .select(select), .outA(outA[7]), .outB(outB[7]));
endmodule
`endif
