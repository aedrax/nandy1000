// |    in    |   out    |
// | 00000000 | 11111111 |
// | 11111111 | 00000000 |
// | 10101010 | 01010101 |
// | 00111100 | 11000011 |
// | 00010010 | 11101101 |
`include "Not8bit.v"

module Not16bit(out, in);
    output wire out[15:0];
    input  wire in[15:0];

    Not8bit bit0_7(.out(out[7:0]), .in(in[7:0]));
    Not8bit bit8_15(.out(out[15:8]), .in(in[15:8]));
endmodule
}
