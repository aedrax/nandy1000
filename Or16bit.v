`ifndef _Or16BIT
`define _Or16BIT
`include "Or8bit.v"

module Or16bit(out, inA, inB);
    output wire [15:0] out;
    input  wire [15:0] inA;
    input  wire [15:0] inB;

    Or8bit bit0_7(.out(out[7:0]), .inA(inA[7:0]), .inB(inB[7:0]));
    Or8bit bit8_15(.out(out[15:8]), .inA(inA[15:8]), .inB(inB[15:8]));
endmodule
`endif
