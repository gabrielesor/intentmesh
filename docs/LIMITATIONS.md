# Limitations

IntentMesh is a proof of concept and reference architecture. Its public evidence supports a bounded historical experiment: a prepared intent led through a constrained workflow to a synthetic Ethereum Sepolia deposit and recorded finalized observations. That result is useful for reviewing authority boundaries and verification design. It does not establish general system correctness or suitability for managing funds.

**Synthetic economics and a narrow chain surface**

The contracts and assets are purpose-built fixtures. imUSDC is a synthetic token, unrelated to an issuer-backed stablecoin. Alpha and Beta are synthetic vault instances. Deposits mint one-for-one position units into a shared position-accounting contract. There is no real DeFi integration, market liquidity, interest accrual, realized APY, withdrawal or redemption product, or measured investment performance.

The sources expose selected familiar token and vault operations, but this portfolio makes no claim of complete ERC-20 or ERC-4626 compliance. The contracts do not constitute a complete lending protocol. They provide an inspectable public-chain surface for the architecture experiment, with source-level behavior described in the [contract guide](../contracts/README.md).

The demonstrated public network is Ethereum Sepolia only. There was no real-fund execution or mainnet execution. Testnet ETH paid testnet gas. No Flow/Cadence or other platform integration is demonstrated, and there is no external cross-chain execution, bridge integration, resolver deployment, or solver marketplace demonstration.

**The model evidence stops before live semantic quality**

The public Sepolia run begins from a prepared Formal Intent that has already been admitted. No live LLM call occurs in that public execution run. The local integrated demonstration starts with a human request but uses a controlled provider response and validated specialist artifacts. Separate local tests exercise A2A and MCP processes.

An external model-provider adapter exists in the underlying implementation. Its presence and controlled tests do not establish live-model semantic extraction accuracy, general prompt-injection resistance, or an uninterrupted live natural-language-to-Sepolia execution. Optional AI explanations are not implemented. Risk and Strategy are deterministic in this PoC, and models cannot authorize signing or override policy.

**Security and operations remain experimental**

There is no independent security audit, formal verification, or production custody validation. The restricted signer uses an encrypted software keystore, not HSM or MPC custody. It is a separate process that shares validation code with the workflow; common defects and host compromise remain possible.

The file-backed replay registry is not a distributed concurrency or recovery system. Uncertain broadcasts and partial execution require reconciliation. A postcondition failure cannot roll back an included transaction. Exact simulation remains conditional on its state and assumptions; the public read-only simulation is narrower than the local snapshot execution method.

Most IntentMesh policy and approval restrictions are off-chain workflow controls. The public contracts do not intrinsically enforce the complete intent, approval, replay, or risk model. Mainnet exclusion is a workflow/configuration guard and account-use requirement, not a property of the EOA key or synthetic bytecode. Deterministic behavior can still be wrong because of faulty rules, implementation bugs, or false evidence.

**Historical evidence has a specific claim boundary**

The [evidence index](../evidence/README.md) distinguishes chain observations from off-chain assertions. Four runtime bytecode observations and thirteen state checks at one common finalized block support this particular synthetic result. A successful receipt alone does not prove a successful economic outcome. Agreement between two RPC endpoints does not prove complete infrastructure independence.

The trace exposes artifact hashes and ordering without disclosing all preimages or approval material. Consistency is not factual truth, authorship, an authenticated timestamp, or an externally anchored attestation. Older preparation and deployment statuses remain unchanged in their original records; later finality evidence supplies the subsequent observation.

This subset contains selected documents, evidence schemas, and contract sources. It is not the whole implementation or a clean-room execution package. A standalone public verifier, build verifier, public verifier tests, CI, and complete reproduction are deferred. Historical source references in immutable evidence are explained in the evidence index; they do not imply that omitted files are present. No historical whole-project release manifest is asserted to cover this curated directory.
