pragma circom 2.1.6;

include "circomlib/poseidon.circom";
include "circomlib/comparators.circom";
template IntergerDivision() {
    signal input a;
    signal input b;
    signal output c;
    assert(b >1);
    signal qoutient <-- a\b;
    signal remainder <-- a % b;
    qoutient * b + remainder ===a;
    component validA = LessThan(64);
    validA.in[0]<== qoutient;
    validA.in[1]<== a;
    validA.out ===1;
    component validQoutient =LessThan(64);
    validQoutient.in[0]<== remainder;
    validQoutient.in[1]<== a;
    validQoutient.out===1;
    c<== qoutient;
}

component main { public [ a,b ] } = IntergerDivision();


/* INPUT = {
    "a": 10000,
    "b":1
} */