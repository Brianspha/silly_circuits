pragma circom 2.1.6;

include "circomlib/poseidon.circom";
include "circomlib/comparators.circom";

//@dev This is a work in progress template for floating point division
template FloatinPointDivision() {
    signal input a;
    signal input b;
    signal output c;
    assert(b >0);
  
}

component main { public [ a,b ] } = FloatinPointDivision();


/* INPUT = {
    "a": 10000,
    "b":1
} */