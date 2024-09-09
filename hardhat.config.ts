import "@solarity/hardhat-zkit"; // TypeScript
import "@solarity/chai-zkit"; // TypeScript


module.exports = {
  zkit: {
    circuitsDir: "circuits",
    compilationSettings: {
      artifactsDir: "zkit/artifacts",
      onlyFiles: [],
      skipFiles: [],
      c: false,
      json: false,
    },
    setupSettings: {
      contributionSettings: {
        contributionTemplate: "groth16",
        contributions: 1,
      },
      onlyFiles: [],
      skipFiles: [],
      ptauDir: undefined,
      ptauDownload: true,
    },
    typesSettings: {
      typesArtifactsDir: "zkit/abi",
      typesDir: "generated-types/zkit",
    },
    verifiersDir: "contracts/verifiers",
    verifiersType: "sol",
    nativeCompiler: false,
    quiet: false,
  },
};