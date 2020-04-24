`ifndef _AND16BIT
`define _AND16BIT
`include "And8bit.v"

module And16bit(out, inA, inB);
    output wire [15:0] out;
    input  wire [15:0] inA;
    input  wire [15:0] inB;

    And8bit bit0_7(.out(out[7:0]), .inA(inA[7:0]), .inB(inB[7:0]));
    And8bit bit8_15(.out(out[15:8]), .inA(inA[15:8]), .inB(inB[15:8]));
endmodule
`endif
