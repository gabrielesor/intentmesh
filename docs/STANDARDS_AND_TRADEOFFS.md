# Standards and trade-offs

IntentMesh uses standards for transport, identifiers, validation, canonicalization, and typed signing, while keeping consequential financial semantics explicit. A standard can make two components exchange the same representation without making them agree about who has authority, which risks are acceptable, or what outcome is sufficient. Those decisions remain part of the architecture.

Three classifications prevent interoperability claims from expanding beyond the implementation:

| Classification | Meaning in this project | Example |
|---|---|---|
| STANDARD | An external specification supplies a mechanism or representation. | MCP tool interaction, JSON Schema, EIP-712 typed-data encoding. |
| PROJECT PROFILE | IntentMesh constrains a standard for a particular use. | Read-only evidence capabilities or the fields bound by execution approval. |
| CUSTOM DOMAIN SEMANTICS | IntentMesh defines meaning and decision rules the standard does not supply. | Protected financial authority, candidate eligibility, risk-first selection, and economic postconditions. |

These categories can coexist in one artifact. An EIP-712 approval uses standard cryptographic encoding, an IntentMesh profile, and project-defined authorization meaning. It is inaccurate to call the entire artifact a universal standard or to assume that transport compatibility establishes semantic compatibility.

**MCP: bounded evidence access**

The [Model Context Protocol tools specification](https://modelcontextprotocol.io/specification/2025-11-25/server/tools) provides a common mechanism for exposing and invoking tools. IntentMesh uses that role for bounded, read-only evidence capabilities. The underlying implementation exercises authenticated access, structured responses, profile validation, and hostile or stale evidence cases.

Read-only behavior is an IntentMesh capability restriction, not a property of every MCP server. The project defines what a financial evidence field means, which source is acceptable, and when its value is stale. A successful tool invocation cannot authorize a transaction. The signed synthetic fixture makes provenance and deterministic behavior testable; it does not turn fixture metrics into actual market evidence.

This boundary keeps evidence access separate from signing and submission. Expanding it to a live financial provider would require new source assessment, freshness assumptions, and acceptance evidence. Reusing the transport would not discharge those responsibilities.

**A2A: collaboration without implied model authority**

The [A2A specification](https://a2a-protocol.org/latest/specification/) defines service discovery and structured collaboration through messages, tasks, and artifacts. In IntentMesh, Risk and Strategy implement those interfaces with deterministic code. A2A does not imply that specialists are LLM agents, and an advertised capability is not proof of financial competence or permission to act.

The project profile narrows acceptable tasks, artifacts, authentication, and failure behavior. Local tests exercised separate processes, cancellation and timeout behavior, malformed artifacts, and an alternative Risk implementation. The integrated local workflow consumed validated specialist outputs; it did not itself start every process and a live model in one uninterrupted test.

The separation had a measured cost. A historical local microbenchmark used one warm-up and nine alternating samples on Docker/Node loopback, with the same Risk processor and evidence held in memory. Median latency was 7.237 ms for a direct typed call and 23.870 ms through A2A: 16.633 ms additional median latency. This isolates a local protocol boundary; it is not a production capacity or tail-latency result.

A2A was retained for inspectable service boundaries, substitution, and failure isolation. That choice remains conditional: if these benefits no longer justify the protocol and operational complexity, a direct typed interface is a valid simplification. The benchmark harness and full process tests are outside this curated subset.

**JSON Schema and CAIP: shape and identity**

[JSON Schema 2020-12](https://json-schema.org/draft/2020-12) supplies structural validation. The seven [evidence schemas](../evidence/README.md) retain their original IDs and bytes. They constrain the shape of public records; they do not establish evidence truth, recompute cryptographic bindings, or implement the full admission policy.

CAIP identifiers attach explicit network context to identities. The [CAIP-2 chain identifier specification](https://standards.chainagnostic.org/CAIPs/caip-2) supplies the chain form used here: eip155:11155111 identifies Ethereum Sepolia. The project additionally validates the expected chain and genesis, and binds account and asset context where required. Identifier syntax alone cannot authenticate an RPC endpoint or make an address an approved beneficiary.

Keeping exact financial quantities explicit is a complementary project decision. Integer smallest units and defined rate representations prevent display formatting or floating-point approximation from silently changing execution meaning. A schema can require an integer-shaped string; the application still owns the unit, scale, provenance, and acceptable range.

**Canonicalization and hashing: consistent identities**

[RFC 8785](https://www.rfc-editor.org/rfc/rfc8785) defines JSON canonicalization. IntentMesh applies canonical serialization and Keccak-256 to selected artifact identities and trace records. The historical build report uses SHA-256 for source files and Keccak-256 for bytecode. These are separate identity mechanisms, not interchangeable labels for one generic checksum.

The project decides which fields enter a digest, which self-hash field is excluded, and how downstream artifacts reference it. Consistent hashes detect changes relative to a claimed identity. They do not prove authorship, timing, factual accuracy, or independent review. The public trace is a project-specific off-chain record, with no external signature or anchoring claimed.

Canonicalization also has an ingestion boundary: it operates on parsed values. It cannot recover duplicate object keys discarded by an earlier parser. The current implementation does not establish universal duplicate-key rejection at every input. A standard's input requirements and the behavior of an application parser must be assessed separately.

**EIP-712: an explicit IntentMesh approval profile**

[EIP-712](https://eips.ethereum.org/EIPS/eip-712) supplies typed structured-data hashing and signing with domain separation. It does not supply replay protection. IntentMesh defines an approval profile binding the intent, full selected plan, simulation, policy bundle, schema-version identifiers, chain, signer, beneficiary, nonce, and validity interval. Expiry and replay enforcement are application responsibilities.

The selected vault address is used as the off-chain approval-domain binding; the synthetic vault does not verify this approval on-chain. The schema-version digest covers a map of schema IDs, not the full bytes of the schemas. Both details limit what a valid signature establishes.

Separating semantic confirmation from execution approval adds an interaction but makes authorization concrete. The user first confirms meaning and later approves a specific simulated operation. Reusing confirmation as a general execution mandate would erase that distinction.

**ERC-7683: bounded mapping, not the intent ontology**

[ERC-7683](https://eips.ethereum.org/EIPS/eip-7683) describes a solver-facing interface for intent protocols. IntentMesh implements a bounded projection toward solver-facing representations, with mapping limits recorded in the underlying design. Compatibility here is mapping-only. The project does not demonstrate a resolver, solver marketplace, or external cross-chain interoperability.

ERC-7683 is not the universal IntentMesh ontology. A solver-facing representation does not carry the complete field-authority model, evidence provenance, policy rationale, or user-confirmation semantics. Those meanings remain explicit custom domain semantics. Publishing a projection does not justify claiming full protocol conformance or interoperability with arbitrary solvers.

**ERC-8004 and constrained decision-making**

[ERC-8004](https://eips.ethereum.org/EIPS/eip-8004) addresses agent identity, reputation, and validation registries. IntentMesh treats such information as optional, deferred evidence. It is not implemented as authorization. A reputation signal would not grant a specialist signing rights, waive a policy constraint, or replace user approval.

The remaining choices are deliberately domain-specific: finite candidates instead of open-ended transaction generation, policy before selection, and risk-first ordering instead of pure yield maximization. These choices reduce flexibility and require explicit profile changes to expand supported behavior. Their benefit is a decision surface that can be inspected, rejected, simulated, and bound to approval. The [architecture](ARCHITECTURE.md) describes the resulting flow; the [limitations](LIMITATIONS.md) define the scope of the demonstrations.
