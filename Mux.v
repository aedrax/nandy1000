module Mux(out, select, inA, inB);
    output wire out;
    input  wire select;
    input  wire inA;
    input  wire inB;    

    assign out = select ? inB : inA;
endmodule
