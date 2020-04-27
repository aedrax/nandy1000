// Output will be A if select is 0 and B if select is 1
`ifndef _MUX4WAY8bit
`define _MUX4WAY8bit
`include "Mux4way.v"

module Mux4way8bit(out, select, inA, inB, inC, inD);
    output wire [7:0] out;
    input  wire [1:0] select;
    input  wire [7:0] inA;
    input  wire [7:0] inB;
    input  wire [7:0] inC;
    input  wire [7:0] inD;

    Mux4way bit0(.out(out[0]), .select(select), .inA(inA[0]), .inB(inB[0]), .inC(inC[0]), .inD(inD[0]));
    Mux4way bit1(.out(out[1]), .select(select), .inA(inA[1]), .inB(inB[1]), .inC(inC[1]), .inD(inD[1]));
    Mux4way bit2(.out(out[2]), .select(select), .inA(inA[2]), .inB(inB[2]), .inC(inC[2]), .inD(inD[2]));
    Mux4way bit3(.out(out[3]), .select(select), .inA(inA[3]), .inB(inB[3]), .inC(inC[3]), .inD(inD[3]));
    Mux4way bit4(.out(out[4]), .select(select), .inA(inA[4]), .inB(inB[4]), .inC(inC[4]), .inD(inD[4]));
    Mux4way bit5(.out(out[5]), .select(select), .inA(inA[5]), .inB(inB[5]), .inC(inC[5]), .inD(inD[5]));
    Mux4way bit6(.out(out[6]), .select(select), .inA(inA[6]), .inB(inB[6]), .inC(inC[6]), .inD(inD[6]));
    Mux4way bit7(.out(out[7]), .select(select), .inA(inA[7]), .inB(inB[7]), .inC(inC[7]), .inD(inD[7]));

endmodule
`endif
