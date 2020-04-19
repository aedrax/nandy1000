module Fulladder(sum, carry, inA, inB, inCarry);
    output sum;
    output carry;
    input  inA;
    input  inB;
    input  inCarry;

    wire ha1Sum;
    wire ha1Carry;
    wire ha2Carry;

    Halfadder ha1(ha1Sum, ha1Carry, inA, inB);
    Halfadder ha2(sum, ha2Carry, ha1Sum, inCarry);
    Or carryPicker(carry, ha1Carry, ha2Carry);
endmodule
