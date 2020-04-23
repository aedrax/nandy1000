// |    in    |   out    |
// | 00000000 | 11111111 |
// | 11111111 | 00000000 |
// | 10101010 | 01010101 |
// | 00111100 | 11000011 |
// | 00010010 | 11101101 |
`ifndef _NOT8BIT
`define _NOT8BIT
`include "Not.v"

module Not8bit(out, in);
    output wire [7:0] out;
    input  wire [7:0] in;

    Not bit0(.out(out[0]), .in(in[0]));
    Not bit1(.out(out[1]), .in(in[1]));
    Not bit2(.out(out[2]), .in(in[2]));
    Not bit3(.out(out[3]), .in(in[3]));
    Not bit4(.out(out[4]), .in(in[4]));
    Not bit5(.out(out[5]), .in(in[5]));
    Not bit6(.out(out[6]), .in(in[6]));
    Not bit7(.out(out[7]), .in(in[7]));
endmodule
`endif
