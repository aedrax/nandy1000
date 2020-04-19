module Mux(out, in0, in1, sel);
    output wire out;
    input  wire in0;
    input  wire in1;
    input  wire sel;

    assign out = sel ? in1 : in0;
endmodule
