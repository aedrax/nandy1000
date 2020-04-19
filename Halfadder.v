module Halfadder(sum, carry, inA, inB);
    output sum;
    output carry;
    input  inA;
    input  inB;

    Xor sumgate(.out(sum), .inA(inA), .inB(inB));
    And carrygate(.out(carry), .inA(inA), .inB(inB));
endmodule
