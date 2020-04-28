`ifndef _OR8WAY
`define _OR8WAY
`include "Or.v"

module Or8way(out, in);
    output wire out;
    input  wire [7:0] in;

    wire bit1out;
    wire bit2out;
    wire bit3out;
    wire bit4out;
    wire bit5out;
    wire bit6out;

    Or bit1(.out(bit1out), .inA(in[0]), .inB(in[1]));
    Or bit2(.out(bit2out), .inA(bit1out), .inB(in[2]));
    Or bit3(.out(bit3out), .inA(bit2out), .inB(in[3]));
    Or bit4(.out(bit4out), .inA(bit3out), .inB(in[4]));
    Or bit5(.out(bit5out), .inA(bit4out), .inB(in[5]));
    Or bit6(.out(bit6out), .inA(bit5out), .inB(in[6]));
    Or bit7(.out(out), .inA(bit6out), .inB(in[7]));
endmodule
`endif
