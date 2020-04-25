// Output will be A if select is 0 and B if select is 1
`ifndef _MUX16BIT
`define _MUX16BIT
`include "Mux8bit.v"

module Mux16bit(out, select, inA, inB);
    output wire [15:0] out;
    input  wire select;
    input  wire [15:0] inA;
    input  wire [15:0] inB;    

    Mux8bit bit0_7(.out(out[7:0]), .select(select), .inA(inA[7:0]), .inB(inB[7:0]));
    Mux8bit bit8_15(.out(out[15:8]), .select(select), .inA(inA[15:8]), .inB(inB[15:8]));

endmodule
`endif
