`ifndef _NOT16BIT
`define _NOT16BIT
`include "Not8bit.v"

module Not16bit(out, in);
    output wire [15:0] out;
    input  wire [15:0] in;

    Not8bit bit0_7(.out(out[7:0]), .in(in[7:0]));
    Not8bit bit8_15(.out(out[15:8]), .in(in[15:8]));
endmodule
`endif
