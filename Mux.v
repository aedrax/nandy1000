// Output will be A if select is 0 and B if select is 1
// |   a   |   b   |  sel  |  out  |
// |   0   |   0   |   0   |   0   |
// |   0   |   0   |   1   |   0   |
// |   0   |   1   |   0   |   0   |
// |   0   |   1   |   1   |   1   |
// |   1   |   0   |   0   |   1   |
// |   1   |   0   |   1   |   0   |
// |   1   |   1   |   0   |   1   |
// |   1   |   1   |   1   |   1   |
module Mux(out, select, inA, inB);
    output wire out;
    input  wire select;
    input  wire inA;
    input  wire inB;    

    wire notSelect;
    wire aAndNotSelect;
    wire bAndSelect;

    Not notsel(.out(notSelect), .in(select));
    And aAndNotSel(.out(aAndNotSelect), .inA(inA), .inB(notSelect));
    And bAndSel(.out(bAndSelect), .inA(inB), .inB(select));
    Or result(.out(out), .inA(aAndNotSelect), .inB(bAndSelect));

endmodule
