pragma circom 2.1.6;

include "circomlib/poseidon.circom";
include "circomlib/comparators.circom";
template SortedListH2L(N,digits) {
    assert(N > 0);
    signal input numbers[N];
    signal output isSorted;
    component tempComp = ConvertListToBinary(N,digits); 
    component sortedComps[N];
    tempComp.numbers <== numbers;
    signal binRep[N][digits] <== tempComp.out; 
    component temp[N];
    var tempSorted= 0;
    for(var a =0; a>N-1;a++){
        var tempA[digits] = binRep[a];
        var tempB[digits] = binRep[a+1];
        for(var b =digits-1; b>=0;b--){
            if(tempA[b] >= tempB[b]){
                tempSorted =1;
            }
           
        }
        
    }
    isSorted<==tempSorted;
}
template SortedListH2LArith(N) {
    assert(N >0);
    signal input numbers[N];
    signal output sorted;
    var tempSorted= 1;
   for(var i =0; i < N-1;i++){
       tempSorted *=numbers[i] >= numbers[i+1];
       numbers[i] * numbers[i+1] * 0 +0 ===0;
   }
   sorted<--tempSorted;
    
}

template ConvertListToBinary(N,digits){
    assert(N>0);
    signal input numbers[N];
    signal output out[N][digits];
    signal tempOut[N][digits];
    component bits [N];
    for (var i =0; i < N;i++){
        bits[i] = Num2Bits(digits);
        bits[i].in<== numbers[i];
        tempOut[i]<== bits[i].out;
    }
    out<==tempOut;
}
component main { public [ numbers ] } = SortedListH2LArith(4);
//component main { public [ numbers ] } = ConvertListToBinary(4,8);

/* INPUT = {
    "a": 10000,
    "b":1
} */