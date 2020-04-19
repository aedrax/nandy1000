module Demux(in, select, outA, outB);
    input  wire in;
    input  wire select;
    output wire outA;
    output wire outB;    

    assign outA = select ? 1b'0 : in;
    assign outB = select ? in : 1b'0;
endmodule
