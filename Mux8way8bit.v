// sel | out
// 000 | a
// 001 | b
// 010 | c
// 011 | d
// 100 | e
// 101 | f
// 110 | g
// 111 | h

`ifndef _MUX8WAY8bit
`define _MUX8WAY8bit
`include "Mux8way.v"

module Mux8way8bit(out, select, inA, inB, inC, inD, inE, inF, inG, inH);
    output wire [7:0] out;
    input  wire [2:0] select;
    input  wire [7:0] inA;
    input  wire [7:0] inB;
    input  wire [7:0] inC;
    input  wire [7:0] inD;
    input  wire [7:0] inE;
    input  wire [7:0] inF;
    input  wire [7:0] inG;
    input  wire [7:0] inH;

    Mux8way bit0(.out(out[0]), .select(select),
                 .inA(inA[0]), .inB(inB[0]), .inC(inC[0]), .inD(inD[0]),
                 .inE(inE[0]), .inF(inF[0]), .inG(inG[0]), .inH(inH[0]));

    Mux8way bit1(.out(out[1]), .select(select),
                 .inA(inA[1]), .inB(inB[1]), .inC(inC[1]), .inD(inD[1]),
                 .inE(inE[1]), .inF(inF[1]), .inG(inG[1]), .inH(inH[1]));

    Mux8way bit2(.out(out[2]), .select(select),
                 .inA(inA[2]), .inB(inB[2]), .inC(inC[2]), .inD(inD[2]),
                 .inE(inE[2]), .inF(inF[2]), .inG(inG[2]), .inH(inH[2]));

    Mux8way bit3(.out(out[3]), .select(select),
                 .inA(inA[3]), .inB(inB[3]), .inC(inC[3]), .inD(inD[3]),
                 .inE(inE[3]), .inF(inF[3]), .inG(inG[3]), .inH(inH[3]));

    Mux8way bit4(.out(out[4]), .select(select),
                 .inA(inA[4]), .inB(inB[4]), .inC(inC[4]), .inD(inD[4]),
                 .inE(inE[4]), .inF(inF[4]), .inG(inG[4]), .inH(inH[4]));

    Mux8way bit5(.out(out[5]), .select(select),
                 .inA(inA[5]), .inB(inB[5]), .inC(inC[5]), .inD(inD[5]),
                 .inE(inE[5]), .inF(inF[5]), .inG(inG[5]), .inH(inH[5]));

    Mux8way bit6(.out(out[6]), .select(select),
                 .inA(inA[6]), .inB(inB[6]), .inC(inC[6]), .inD(inD[6]),
                 .inE(inE[6]), .inF(inF[6]), .inG(inG[6]), .inH(inH[6]));

    Mux8way bit7(.out(out[7]), .select(select),
                 .inA(inA[7]), .inB(inB[7]), .inC(inC[7]), .inD(inD[7]),
                 .inE(inE[7]), .inF(inF[7]), .inG(inG[7]), .inH(inH[7]));


endmodule
`endif
