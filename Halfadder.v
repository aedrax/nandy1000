module Halfadder(sum, carry, inA, inB);
    output sum;
    output carry;
    input  inA;
    input  inB;

    Xor sumgate(sum, inA, inB);
    And carrygate(carry, inA, inB);
endmodule
