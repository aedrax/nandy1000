`ifndef _FULLADDER
`define _FULLADDER
`include "Halfadder.v"
`include "Or.v"

module Fulladder(sum, carry, inA, inB, inCarry);
    output sum;
    output carry;
    input  inA;
    input  inB;
    input  inCarry;

    wire ha1Sum;
    wire ha1Carry;
    wire ha2Carry;

    Halfadder ha1(.sum(ha1Sum), .carry(ha1Carry), .inA(inA), .inB(inB));
    Halfadder ha2(.sum(sum), .carry(ha2Carry), .inA(ha1Sum), .inB(inCarry));
    Or carryPicker(.out(carry), .inA(ha1Carry), .inB(ha2Carry));
endmodule
`endif
