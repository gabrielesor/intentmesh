# Synthetic execution contracts

These three Solidity sources supplied four contract instances in the historical Ethereum Sepolia demonstration. They are copied without changing source bytes or MIT SPDX headers. They provide purpose-built synthetic state transitions for inspecting the architecture's execution and postcondition boundaries.

| Source | Role and actual scope |
|---|---|
| [LocalToken.sol](src/LocalToken.sol) | Six-decimal imUSDC token accounting, initial supply, transfers, and allowances. The workflow uses a finite allowance even though the source can represent an unlimited one. |
| [LendingVault.sol](src/LendingVault.sol) | Deployed as Alpha and Beta. Transfers the exact deposited asset amount and asks the configured position token to mint equal shares. The owner sets the position token once. |
| [PositionToken.sol](src/PositionToken.sol) | Shared imPOS balance accounting. An owner authorizes vaults to mint. It has no general token-transfer interface. |

This is not a production DeFi implementation, a complete lending protocol, or an audited implementation. No complete ERC-20 or ERC-4626 compliance is claimed. The vault has no interest accrual, borrowing market, withdrawal, or redemption flow. One-for-one synthetic shares do not establish realized yield or redeemable economic value.

The contracts enforce their own access and state-transition rules. They do not verify the IntentMesh EIP-712 execution approval, admit Formal Intents, evaluate risk policy, select plans, or enforce the complete workflow replay model. Those controls live primarily off-chain. In particular, the vault address used in the approval domain does not make the vault an on-chain approval verifier.

The [evidence index](../evidence/README.md) lists exact addresses, deployment/configuration transactions, the finite allowance, the Alpha deposit, and finalized state and runtime code observations. Source-file SHA-256 digests are recorded in the unchanged [historical build evidence](../evidence/sepolia/deployment-build.v1.json). Artifact matching in that historical workflow normalized immutable bytecode ranges; it is not an audit or a claim of explorer source verification.

The curated [foundry.toml](foundry.toml) retains Solidity 0.8.30, optimizer enabled with 200 runs, Prague EVM target, no bytecode metadata hash, disabled CBOR metadata, and disabled dynamic test linking. [foundry-version](foundry-version) preserves the recorded Foundry 1.8.0 pin. The operational RPC alias was removed. Test and script directory settings are retained as build configuration; neither a test suite nor deployment scripts are included.

These settings and sources support inspection of the historical build characteristics. This subset does not provide a build verifier or claim complete clean-room reproduction of the deployment. Historical generated-artifact and deployment-script references remain in the evidence, with their absence explained in the index.

The existing MIT SPDX declarations apply to the selected source files as marked. They do not establish a repository-wide license for the architecture documents or the rest of IntentMesh. No broader license is asserted by this guide.
