# AI engineering approach

I designed and drove IntentMesh with intensive AI assistance over approximately **one focused week and about 30 hours of my own effort**, using ChatGPT and OpenAI Codex extensively. This is my approximate effort estimate, not a precise timesheet reconstructed from commits, document dates, or implementation milestones.

Development-time AI and runtime AI have different roles. During development, AI helped produce and challenge engineering work across the stack. At runtime, the model is confined to proposing semantic meaning before deterministic admission. Extensive use of AI to write software does not grant the runtime model authority over that software's financial decisions.

**Development work and accountability**

I used ChatGPT and Codex for research, comparison of standards, architectural challenge and review, implementation, tests, documentation, refactoring, and technical learning and validation. They helped turn design constraints into executable checks, investigate failures, and reconcile code with intended behavior. AI assistance also helped me connect unfamiliar protocol details with concrete implementation decisions.

I retained responsibility for problem definition, architecture, standards-fit decisions, the deterministic/probabilistic boundary, security boundaries, acceptance criteria, review, and final disposition. I reviewed and accepted work iteratively; review depth varied. I do not claim complete line-by-line review, independent review, or a security audit.

I used explicit boundaries as review targets: who may supply a field, what evidence supports a decision, which operation may be signed, and how success is observed. I treated generated code and tests as engineering artifacts to challenge. Passing tests were useful acceptance evidence only within the cases and assumptions they exercised.

**Correction: valid Gamma evidence was stopped at the wrong boundary**

The problem appeared when the integrated flow encountered evidence concerning Gamma, a deliberately policy-ineligible candidate. Admission initially rejected that evidence because Gamma was prohibited for execution. This conflated evidence validity with plan eligibility and prevented the later policy stage from producing the intended explicit rejection.

Integrated review exposed the mismatch between the architecture and the observed failure point. The correction allowed validated, non-authorizing evidence through admission while retaining Gamma as an evaluation-only candidate. Policy then rejected Gamma, and selection considered only accepted candidates. The change did not grant Gamma execution authority or weaken the eligibility rule.

Acceptance evidence came from the integrated workflow and regression assertions: the finite candidate set could be evaluated, Gamma received the policy rejection, and Alpha was selected from eligible alternatives. Adversarial admission checks continued to reject unauthorized changes. This case illustrates a review question beyond “did the request fail?”: it also matters whether it failed at the boundary responsible for that decision.

**Correction: deployment preflight contradicted successful deployment**

The original deployment flow required a fresh dedicated account at nonce zero. Manifest generation reused that same preflight after eight deployment and configuration transactions. A successful deployment would therefore have failed its post-deployment check precisely because the account had advanced to nonce eight.

Review identified the lifecycle contradiction before the successful public deployment. The correction separated a pre-deployment gate requiring nonce zero from post-deployment verification requiring nonce eight. Initial funding checks were not blindly reapplied as if confirmed operations were new authorization requests. Network identity and transaction-specific constraints still had to hold.

Regression tests accepted the expected post-deployment nonce and rejected incorrect states, including nonce zero or seven at that stage and a non-EOA deployer. Type checking and the unit suite were recorded as passing for the correction. The subsequent public deployment and manifest provide a separate observable outcome; they do not alone prove every preflight branch.

The correction also made partial-write handling explicit. Sequential blockchain transactions are not atomic. If some transactions exist, failure handling must preserve enough information to reconcile them before another attempt. A blind fresh redeployment is not an acceptable recovery strategy. That operational lesson remains relevant even though deployment scripts are outside this public subset.

**Runtime authority stays narrow**

A model may interpret or propose meaning. It may not access private keys, sign transactions, broadcast transactions, invent protected financial constraints, approve policy exceptions, replace deterministic selection, or redefine verified outcomes. Risk and Strategy are deterministic implementations. User confirmation resolves semantics; a separate human approval authorizes the exact selected operation after simulation.

The historical public run started with a prepared, admitted intent and included no live model call. The local integrated demonstration used a controlled provider. Neither result measures live-model semantic extraction accuracy. Optional AI explanations are not implemented. The [architecture](ARCHITECTURE.md) explains where these boundaries sit, and the [public trace](../evidence/sepolia/public-trace.v1.json) records the narrower public execution scope.

**Limits of rapid AI-assisted implementation**

Review depth was uneven. Generated implementation and generated tests can share the same mistaken assumption, so a green suite cannot establish independence. Documentation can drift as a local design becomes a public-testnet workflow; this account follows the final demonstrated behavior rather than treating every historical statement as current.

The correction cases show challenged output and bounded acceptance evidence. They do not substitute for independent security review, formal verification, production custody validation, or recovery testing under operational stress. The public subset contains selected evidence and synthetic contract sources, not the complete test suite or application implementation. Local test outcomes described here are historical engineering evidence, not newly reproduced public checks.

My architectural contribution is the explicit allocation of authority and the review of whether each failure occurs at the boundary responsible for that decision. I remain responsible for deciding what evidence is sufficient for this PoC and stating where it stops. The [security model](SECURITY_MODEL.md) and [limitations](LIMITATIONS.md) keep that acceptance decision visible alongside the demonstrated result.
