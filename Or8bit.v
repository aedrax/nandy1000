`ifndef _OR8BIT
`define _OR8BIT
`include "Or.v"

module Or8bit(out, inA, inB);
    output wire [7:0] out;
    input  wire [7:0] inA;
    input  wire [7:0] inB;

    Or bit0(.out(out[0]), .inA(inA[0]), .inB(inB[0]));
    Or bit1(.out(out[1]), .inA(inA[1]), .inB(inB[1]));
    Or bit2(.out(out[2]), .inA(inA[2]), .inB(inB[2]));
    Or bit3(.out(out[3]), .inA(inA[3]), .inB(inB[3]));
    Or bit4(.out(out[4]), .inA(inA[4]), .inB(inB[4]));
    Or bit5(.out(out[5]), .inA(inA[5]), .inB(inB[5]));
    Or bit6(.out(out[6]), .inA(inA[6]), .inB(inB[6]));
    Or bit7(.out(out[7]), .inA(inA[7]), .inB(inB[7]));
endmodule
`endif
