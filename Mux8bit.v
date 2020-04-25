// Output will be A if select is 0 and B if select is 1
`ifndef _MUX8BIT
`define _MUX8BIT
`include "Mux.v"

module Mux8bit(out, select, inA, inB);
    output wire [7:0] out;
    input  wire select;
    input  wire [7:0] inA;
    input  wire [7:0] inB;    

    Mux bit0(.out(out[0]), .select(select), .inA(inA[0]), .inB(inB[0]));
    Mux bit1(.out(out[1]), .select(select), .inA(inA[1]), .inB(inB[1]));
    Mux bit2(.out(out[2]), .select(select), .inA(inA[2]), .inB(inB[2]));
    Mux bit3(.out(out[3]), .select(select), .inA(inA[3]), .inB(inB[3]));
    Mux bit4(.out(out[4]), .select(select), .inA(inA[4]), .inB(inB[4]));
    Mux bit5(.out(out[5]), .select(select), .inA(inA[5]), .inB(inB[5]));
    Mux bit6(.out(out[6]), .select(select), .inA(inA[6]), .inB(inB[6]));
    Mux bit7(.out(out[7]), .select(select), .inA(inA[7]), .inB(inB[7]));

endmodule
`endif
