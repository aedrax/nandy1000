module Demux(out0, out1, in, sel);
    output wire out0;
    output wire out1;
    input  wire in;
    input  wire sel;

    assign out0 = sel ? 1b'0 : in;
    assign out1 = sel ? in : 1b'0;
endmodule