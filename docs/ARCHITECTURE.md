# Architecture

IntentMesh separates interpretation, financial decision-making, authorization, and execution. Each transition produces an artifact that downstream code can validate. The architectural thesis is that a model can help interpret a request without acquiring authority over protected constraints or transaction bytes.

The [authority diagram](../diagrams/authority-boundaries.svg) is an architectural view. The following distinctions define what the implementation and its demonstrations actually establish.

| Scope | Established behavior | Evidence boundary |
|---|---|---|
| Architectural capability | A semantic provider adapter, confirmation, specialist collaboration, deterministic admission and execution components exist in the underlying implementation. | This curated subset documents the design; it does not include the application source. |
| Local integrated demonstration | A controlled provider response and validated specialist artifacts feed a request-to-postcondition workflow against a local synthetic chain. | It exercises composition and rejection behavior, not live-model interpretation quality. Separate process tests exercise A2A and MCP. |
| Historical Sepolia execution | A prepared, admitted intent feeds bounded planning, approval, two workflow transactions, and finalized observations. | The public trace expressly records no live model call. Chain evidence covers this historical synthetic execution. |

**Human request and semantic interpretation**

The semantic adapter accepts request text and limited request context. Its job is to propose structured meaning: what the user appears to want, what remains ambiguous, and which clarification or confirmation is required. Model output is untrusted input to later checks. Fluent explanations and syntactically valid JSON do not establish financial authority.

The implementation includes an external model-provider adapter, but its controlled HTTP tests establish the adapter contract and failure behavior. They do not measure extraction accuracy on real users or prove a successful live model call in the public execution. A production interpretation layer would need a representative evaluation set, ambiguity handling, and measured error behavior beyond these tests.

Human confirmation records agreement with the proposed meaning. It does not approve a transaction, bypass admission, or provide a signature for future plans. Keeping confirmation distinct from execution approval matters because the target, calldata, simulation result, and execution conditions are not yet fixed at this point.

**Specialist collaboration and bounded evidence**

Risk and Strategy are deterministic implementations in this PoC. They exchange structured tasks and artifacts through A2A. They are called agents because of their service role and interface, not because they invoke LLMs. The local system also exercises separate service processes and an alternative Risk implementation to investigate substitution and failure isolation.

MCP exposes bounded, read-only evidence capabilities. Specialist outputs derive from validated fixture data under the demonstration profile. Authentication, profile checks, provenance, and freshness rules constrain what can enter the workflow. The fixtures include synthetic financial metrics; an APY-shaped field is neither market data nor a measured investment return.

A specialist recommendation remains a proposal. Evidence may inform a deterministic decision without authorizing execution or modifying protected fields. An attractive venue must still pass policy. This separation also allows the workflow to explain why a considered candidate was rejected rather than silently suppressing all evidence about it.

**Formal Intent admission**

The deterministic compiler combines the confirmed interpretation, authoritative context, and validated evidence into a candidate Formal Intent. Admission checks structure, semantic invariants, field authority, and provenance before accepting it. Missing required authority or inconsistent evidence causes rejection. A model cannot fill a protected financial field merely because it knows the field's name.

Financial quantities use exact representations, including integer smallest units and explicitly defined rates. Chain, account, and asset identities carry network context. This prevents a display amount or an address without a chain from silently becoming execution data. The public principal is 10,000 imUSDC at six decimals, represented as 10,000,000,000 units.

Accepted artifacts receive canonical identities. The workflow uses deterministic JSON canonicalization and Keccak-256 where its profiles specify them. Source-file identity uses SHA-256 in the build evidence. These identities bind downstream operations to specific artifacts; they do not prove that evidence is truthful or that the admission implementation is correct.

The public Sepolia path starts here, from a prepared and admitted intent. Its controlled input must not be confused with fresh model interpretation or a public test of semantic confirmation. The [trace](../evidence/sepolia/public-trace.v1.json) makes that boundary explicit.

**Finite planning, policy, and selection**

Candidate construction is deterministic and finite. The supported operation shapes, targets, and required evidence are constrained by the project profile. The model does not generate arbitrary calldata or search an unrestricted transaction space. The candidate set includes alternatives for evaluation, with eligibility determined separately.

Policy evaluates candidates before selection. Gamma illustrates why this order matters: evidence can be valid while a candidate remains prohibited. Gamma is retained for evaluation and explicitly rejected by policy. Alpha and Beta can then be compared within the accepted set. No scoring advantage permits an ineligible candidate to re-enter selection.

Selection follows an explicit risk-first objective with deterministic ordering and tie-breaking. In the demonstrated scenario Alpha wins. The result expresses a preference encoded in the project rules; it is not an assertion that Alpha is economically superior in an actual lending market. Empty eligibility, invalid evidence, or an unsatisfied invariant stops the workflow.

**Exact simulation and approval**

Simulation applies to the selected operation, including its target, amount, beneficiary, and calldata. The local and public mechanisms differ. Locally, Anvil executes the exact call inside a snapshot, observes state changes and events, and restores the snapshot. Local signing revalidation checks that the simulated chain head still matches the required execution context.

The public preparation instead uses read-only call simulation and gas estimation at a recorded block, with an exact allowance state override to model the approval prerequisite. It does not write that allowance to Sepolia. This checks call behavior and estimated gas under those assumptions; it is not the local snapshot method and does not independently measure every predicted balance change before execution.

After simulation, a human gives a separate execution approval. The IntentMesh EIP-712 profile binds the intent, full selected plan, simulation, policy bundle, schema-version identifiers, chain, signer, beneficiary, nonce, and validity interval. Approval is limited to those artifacts. A materially changed plan or simulation requires new validation and authorization.

The schema-version binding identifies a map of schema IDs; it is not a digest of the complete schema files. The selected vault address is used as an off-chain approval-domain binding. The vault does not verify that EIP-712 approval on-chain. Optional AI explanations of the proposed operation are not implemented and would have no authority to replace these checks.

**Restricted signing and submission**

The Sepolia workflow uses a separate restricted signer process with an interactively unlocked encrypted software keystore. Models, A2A specialists, and MCP tools have no key access. The signing boundary revalidates the authorized operation using shared deterministic validation code. Process separation is useful, but it does not amount to an independently developed verifier or hardware custody.

The workflow permits the exact finite token allowance followed by the exact deposit. Signed EIP-1559 transactions are parsed; the recovered signer and transaction fields must match the expected request before a separate submission step broadcasts them. A different destination, value, chain, calldata, or nonce cannot be accepted simply because the signature is valid.

Replay and expiry checks constrain approval use. A file-backed registry records reservation and consumption, and the public sequence also fixes the relevant transaction nonces. This is a single-process persistence mechanism, not a distributed transaction coordinator. An uncertain broadcast requires reconciliation; an interrupted sequence cannot be treated as if nothing happened.

**Inclusion, finality, and verified outcome**

A successful receipt establishes transaction execution status, not the intended economic result. Postcondition checks additionally compare expected events, token and position balances, allowance consumption, configuration, and other bounded state. The historical public verifier recorded ten transactions, four runtime code observations, and thirteen state checks at one common finalized block using two RPC sources.

The [evidence index](../evidence/README.md) separates independently observable chain facts from the workflow's off-chain account. A hash-linked trace preserves internal ordering and artifact references, but its hidden preimages, timestamps, and human-approval assertions are not independently established by the chain. Endpoint agreement reduces one-source dependence without proving complete infrastructure independence.

The resulting verified outcome is a bounded verdict about this synthetic execution. A failed postcondition does not roll back an included transaction. Mainnet exclusion, exact-approval requirements, and most policy constraints are workflow controls; the [contracts](../contracts/README.md) enforce only their own small state-transition rules. The [security model](SECURITY_MODEL.md) and [limitations](LIMITATIONS.md) describe what remains outside that boundary.
