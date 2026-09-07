# Public Sepolia evidence

The strongest public evidence is the exact finite allowance and Alpha deposit, followed by recorded finalized state. All addresses and transaction hashes below are derived from the copied deployment and finality artifacts. This index describes a historical synthetic execution; no live model participated.

**Network:** Ethereum Sepolia; numeric chain ID 11155111; CAIP-2 eip155:11155111. Genesis block hash: 0x25a5cc106eea7138acab33231d7160d69cb777ee0c2c553fcddf5138993e6dd9.

**Dedicated deployer / workflow source:** [0x2c2807a946e5ae7ef32faf667215362d473318f0](https://sepolia.etherscan.io/address/0x2c2807a946e5ae7ef32faf667215362d473318f0). The recorded beneficiary position check concerns this workflow account.

**Artifact guide**

| Artifact and schema | What it records | Limit |
|---|---|---|
| [deployment-build](sepolia/deployment-build.v1.json) · [schema](../schemas/public-testnet-deployment-build.schema.json) | Compiler settings, source and bytecode digests, and the eight-operation preparation plan. | No deployment or finality claim at this stage. |
| [deployment-manifest](sepolia/deployment-manifest.v1.json) · [schema](../schemas/public-testnet-deployment-manifest.schema.json) | Eight recorded setup transactions, four contract instances, configuration, and runtime matching observations. | Its status predates the later finalized verification. |
| [finality-evidence](sepolia/finality-evidence.v1.json) · [schema](../schemas/public-testnet-finality-evidence.schema.json) | Ten transaction observations, four code observations, and thirteen state checks at a common finalized block. | A bounded historical verifier result, not general correctness. |
| [public-trace](sepolia/public-trace.v1.json) · [schema](../schemas/public-testnet-trace.schema.json) | Fourteen hash-linked records from controlled admitted intent to finalized postconditions. | Off-chain assertions and hidden preimages are not independently proven by the chain. |
| [security-profile](sepolia/security-profile.v1.json) · [schema](../schemas/public-testnet-security-profile.schema.json) | The declared synthetic-only Sepolia network, transaction, signer, and prohibition policy. | Configuration expresses intended restrictions; it does not prove all enforcement. |
| [verification-policy](sepolia/verification-policy.v1.json) · [schema](../schemas/public-testnet-verification-sources.schema.json) | The historical primary/second-source selection and disclosure policy. | The primary endpoint remains redacted; infrastructure independence is not established. |
| [reproduction-sources](sepolia/reproduction-sources.v1.json) · [schema](../schemas/public-testnet-reproduction-sources.schema.json) | Credential-free RPC candidates and public network catalogs for subsequent read-only comparison. | Availability and historical state retention are not guaranteed. |

The seven JSON artifacts and seven schemas retain their original bytes and schema IDs. They form an inspectable evidence set, not a standalone public verifier. This subset provides no verifier command, deployment procedure, or complete reproduction environment.

**Historical chronology**

The build evidence says PREPARED_NOT_DEPLOYED because it records preparation. The deployment manifest says CONFIRMED_NOT_FINALIZED because it records a later confirmation checkpoint. The finality evidence subsequently says FINALIZED_VERIFIED. The security profile's DEPLOYED state describes its own lifecycle checkpoint. These statuses are intentionally preserved rather than rewritten to appear simultaneous.

Finality verification was recorded at **2026-09-05T13:53:35.608Z**. Both sources reported the common finalized block [11640667](https://sepolia.etherscan.io/block/11640667), hash **0xe3a7a5a1ee9a8caf75022a0f67a66b3fe3c4784f38b40ab17a2d7a1883a97182**. This historical target is distinct from whatever the network's current finalized head may be.

**Four contract instances**

| Instance | Exact Sepolia address |
|---|---|
| imUSDC / LocalToken | [0x3466662d1fd8e0bcc5677902fc201d2b9a3ed850](https://sepolia.etherscan.io/address/0x3466662d1fd8e0bcc5677902fc201d2b9a3ed850) |
| Alpha / LendingVault | [0x229bc017c5dd2bac500154610d14b6bf8b367d61](https://sepolia.etherscan.io/address/0x229bc017c5dd2bac500154610d14b6bf8b367d61) |
| Beta / LendingVault | [0x70c262a13e645abf0c878741b6c387bfb072cd6e](https://sepolia.etherscan.io/address/0x70c262a13e645abf0c878741b6c387bfb072cd6e) |
| imPOS / PositionToken | [0xfa916c06cdfcb669389855a2234644f8c5776175](https://sepolia.etherscan.io/address/0xfa916c06cdfcb669389855a2234644f8c5776175) |

**All ten recorded transactions**

The first eight deploy and configure the four instances. Nonce eight approves exactly 10,000,000,000 token units for Alpha; nonce nine deposits that exact amount, equivalent to 10,000 imUSDC at six decimals. Every transaction is recorded with SUCCESS status and source agreement. These are testnet state transitions, with testnet ETH used for gas.

| Operation | Transaction hash on Sepolia | Nonce / receipt block |
|---|---|---|
| Deploy local token | [0x64de2cec81002e1ddcfb381d8115cfe05428c18704cbcd99aeb359db1efbf0e8](https://sepolia.etherscan.io/tx/0x64de2cec81002e1ddcfb381d8115cfe05428c18704cbcd99aeb359db1efbf0e8) | 0 / 11640430 |
| Deploy alpha vault | [0x731af182ec3e9b5d973ed02adbbd28368623aa5388f5989245d81d326d032a29](https://sepolia.etherscan.io/tx/0x731af182ec3e9b5d973ed02adbbd28368623aa5388f5989245d81d326d032a29) | 1 / 11640431 |
| Deploy beta vault | [0xaec98343459290756a58962bf071a47b139586967f0b23979bc4c31deeec25ee](https://sepolia.etherscan.io/tx/0xaec98343459290756a58962bf071a47b139586967f0b23979bc4c31deeec25ee) | 2 / 11640432 |
| Deploy position token | [0x954bc2613d8bfdae832fac93290f0f6fc2783d656dce1aa323e74edb4b95bd56](https://sepolia.etherscan.io/tx/0x954bc2613d8bfdae832fac93290f0f6fc2783d656dce1aa323e74edb4b95bd56) | 3 / 11640433 |
| Configure alpha position token | [0xca543c59810f0d5f01b8514f1a6f78d18de0fc84f9b433484db9f4469891a2c1](https://sepolia.etherscan.io/tx/0xca543c59810f0d5f01b8514f1a6f78d18de0fc84f9b433484db9f4469891a2c1) | 4 / 11640434 |
| Configure beta position token | [0x79342228b04c479921a35d30053d42ce914fe49568659381668581795a81ecf3](https://sepolia.etherscan.io/tx/0x79342228b04c479921a35d30053d42ce914fe49568659381668581795a81ecf3) | 5 / 11640435 |
| Authorize alpha vault | [0x5710a983f38afcd6368f9d420e0288aa53e7c3bab11132dbf0ff5fa798ebc6f0](https://sepolia.etherscan.io/tx/0x5710a983f38afcd6368f9d420e0288aa53e7c3bab11132dbf0ff5fa798ebc6f0) | 6 / 11640436 |
| Authorize beta vault | [0xc8345ab585400af5acb1b65f8e097c8103a9d1556da6609f90b63f8add0d4611](https://sepolia.etherscan.io/tx/0xc8345ab585400af5acb1b65f8e097c8103a9d1556da6609f90b63f8add0d4611) | 7 / 11640437 |
| Approve exact token allowance | [0xfe6d0025aa9e3c5c2b641af81e5005731affae36f85d32799e1771fa249ecda4](https://sepolia.etherscan.io/tx/0xfe6d0025aa9e3c5c2b641af81e5005731affae36f85d32799e1771fa249ecda4) | 8 / 11640610 |
| Execute approved plan | [0x9b452db822093c64e60bee90024d923f0c93f09b98768468a468f6d797bd802c](https://sepolia.etherscan.io/tx/0x9b452db822093c64e60bee90024d923f0c93f09b98768468a468f6d797bd802c) | 9 / 11640616 |

**Four finalized runtime bytecode observations**

Each record reports agreement between the two sources and a match to the deployment manifest. These are Keccak-256 digests of observed deployed runtime bytes.

| Instance | Runtime bytecode Keccak-256 | Agreement / manifest match |
|---|---|---|
| Alpha | 0x28fbe426daec40137e4ed4ef259de836a5524f5abc8bb8a647c8cb5bc15803e2 | Yes / yes |
| Beta | 0x28fbe426daec40137e4ed4ef259de836a5524f5abc8bb8a647c8cb5bc15803e2 | Yes / yes |
| Position | 0xc1609c0bc05d0b2142542ab8183b752cfce7be6fe147c03a7df222621b77bed6 | Yes / yes |
| Token | 0xe92dffda25f57de9a90d9b456831b7421105ba3ef08468df1c2544a3b6fd9bbc | Yes / yes |

The historical build comparison treated immutable ranges specially: it normalized those ranges when comparing deployed runtime to compiler templates. Template digests therefore need not equal deployed runtime digests. The observations are not an audit, a complete constructor-state proof, or a claim of explorer source verification. The three unchanged [contract sources and build settings](../contracts/README.md) provide the available source context.

**Thirteen finalized state checks**

The table gives the expected value; both recorded sources matched it and every check passed at the common block. Token and position amounts are integer smallest units, each with six decimals. Position balances are synthetic accounting units, not a claim about redeemability.

| Check | Expected and observed value |
|---|---|
| alpha-allowance | 0 |
| alpha-position-token | 0xfa916c06cdfcb669389855a2234644f8c5776175 |
| alpha-token-balance | 10000000000 |
| alpha-vault-authorized | true |
| beneficiary-position-balance | 10000000000 |
| beta-allowance | 0 |
| beta-position-token | 0xfa916c06cdfcb669389855a2234644f8c5776175 |
| beta-token-balance | 0 |
| beta-vault-authorized | true |
| deployer-nonce | 10 |
| position-total-supply | 10000000000 |
| source-token-balance | 990000000000 |
| token-total-supply | 1000000000000 |

The source retains 990,000 imUSDC, Alpha holds 10,000, Beta holds zero, and the beneficiary holds 10,000 imPOS. Both remaining allowances are zero. Configuration and authorization checks establish the expected synthetic wiring. Receipt success alone would not establish these outcomes.

**How to interpret and inspect the record**

Explorer links expose transactions, receipt blocks, addresses, and contract activity without requiring this project's software. Historical runtime code and state can be compared through an RPC service that retains the necessary history, after checking the chain ID and genesis. The copied reproduction-sources file lists credential-free candidates; it does not identify the redacted historical primary endpoint or promise current service availability. No fresh live chain re-verification was performed while curating this directory.

The historical verifier compared two RPC sources. Agreement reduces reliance on one answer but does not establish completely independent infrastructure. Public transactions and chain state are independently observable facts; the document's preparation, simulation, policy, approval, and signing assertions are off-chain claims. The trace discloses hashes and decision ordering, not all underlying artifacts or signatures. Its timestamps are recorded metadata, not authenticated external time attestations.

Canonical artifact hashes bind the build to the deployment, the deployment to finality, and the trace to selected public artifacts. Consistency detects changes against those identities; it does not prove factual truth or the correctness of the verifier. The trace has no externally anchored signature asserted here. Schemas validate record structure and do not themselves recompute hashes or prove chain facts.

The immutable build evidence contains historical references to a deployment script and generated compiler artifacts that are deliberately absent. Those path strings describe the original build context; they are not links or instructions to run omitted files. Environment-variable names and source-disclosure labels in the copied configurations identify configuration slots without publishing credentials. Hash references to withheld preparation, approval, signing, and intermediate artifacts are intentional. No historical whole-project release manifest is included or claimed to cover this subset.
