// Output will be A if select is 0 and B if select is 1
`ifndef _MUX
`define _MUX
`include "Not.v"
`include "And.v"
`include "Or.v"

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
`endif
