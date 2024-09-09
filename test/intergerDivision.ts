import { zkit } from "hardhat"; // hardhat-zkit plugin
import { expect } from "chai"; // chai-zkit extension
import { IntergerDivision } from "@zkit"; // zktype circuit-object
async function main() {
  const circuit: IntergerDivision = await zkit.getCircuit("circuits/interger_division.circom:IntergerDivision");
  await expect(circuit)
    .with.witnessInputs({ a: "4", b: "2" })
    .to.have.witnessOutputs({ c: "2" });
  const proof = await circuit.generateProof({ a: "4", b: "2" });
  expect(await circuit.verifyProof(proof)).to.be.true;
}

main()
  .then()
  .catch((e) => console.log(e));
