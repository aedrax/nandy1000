// Output will be on A if select is 0 and B if select is 1, otherwise 0
// |  in   |  sel  |  outA |  outB |
// |   0   |   0   |   0   |   0   |
// |   0   |   1   |   0   |   0   |
// |   1   |   0   |   1   |   0   |
// |   1   |   1   |   0   |   1   |
`include "Not.v"
`include "And.v"

module Demux(in, select, outA, outB);
    input  wire in;
    input  wire select;
    output wire outA;
    output wire outB;

    wire notSelect;

    Not notSel(.out(notSelect), .in(select));
    And bAndSel(.out(outB), .inA(select), .inB(in));
    And aAndNotSel(.out(outA), .inA(notSelect), .inB(in));
endmodule
