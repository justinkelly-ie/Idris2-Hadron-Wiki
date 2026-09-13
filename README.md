# Idris2-Hadron-Wiki

[![Idris 2 Verification](https://img.shields.io/badge/Idris_2-0.8.0-blue.svg)](https://www.idris-lang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**Literate Verification Suite & Specification Manual for Layer 4b (`Idris2-Hadron`)**

`Idris2-Hadron-Wiki` provides formal compile-time macro reflection proofs, QuickCheck property test suites, and literate Markdown specifications for **Layer 4b** of the non-linear discrete multiset physical law ecosystem.

---

## 📚 Specification Chapters & Verification Modules

### 1. `Library/Wiki/HadronScaleTransformSpec.md`
- **Algebra & Homomorphisms:** Specifications for scale transformations mapping subatomic color charge multisets to hadronic bound states (`transformQuarkToHadron`).
- **Verification:** QuickCheck property tests validating color charge conservation, baryon number preservation, and scale transform invariants.

### 2. Literate Observation Chapters (`Library/Wiki/Observations/`)
- **[Hadronic Confinement](Library/Wiki/Observations/HadronicConfinement.md)** — Quark-hadron confinement matrices and color charge neutrality ($R + G + B = 0$).
- **[Standard Model Catalog](Library/Wiki/Observations/StandardModel.md)** — Complete Standard Model particle catalogue and multiset vertices.
- **[Particle Scattering](Library/Wiki/Observations/ParticleScattering.md)** — 2-to-2 particle scattering kinematics and Mandelstam invariants ($s, t, u$).
- **[Hadronization Engine](Library/Wiki/Observations/HadronizationEngine.md)** — QGP jet fragmentation and hadronization automata.
- **[Nucleosynthesis Networks](Library/Wiki/Observations/StellarNucleosynthesis.md)** — Stellar and cosmic nucleosynthesis balance networks (p-p chain, CNO cycle, triple-alpha reaction).

### 3. `Library/Wiki/Main.idr`
- **Verification Runner:** Literate Idris 2 test runner executing compile-time `%macro` reflection proofs and QuickCheck property test suites for Layer 4b (`lhadron-wiki`).

---

## 🚀 Verification & Build

To compile the literate verification suite and execute the test runner binary:

```bash
idris2 --build Idris2-Hadron-Wiki.ipkg
./build/exec/lhadron-wiki
```

---

## 🏗️ 10-Layer Ecosystem Architecture

1. `Idris2-Multiset-Core` / `Idris2-Multiset-Core-Wiki` (Layer 1: Flat Primitives)
2. `Idris2-Multiset-Transform` / `Idris2-Multiset-Transform-Wiki` (Layer 2: Fields & Scale Functors)
3. `Idris2-Multiset-Binary` / `Idris2-Multiset-Binary-Wiki` (Layer 2b: Boolean Field Engines)
4. `Idris2-Multiset-Ternary` / `Idris2-Multiset-Ternary-Wiki` (Layer 2c: Balanced Ternary Sifting)
5. `Idris2-Geometry` / `Idris2-Geometry-Wiki` (Layer 3: Emergent Metric Geometry)
6. `Idris2-Physics` / `Idris2-Physics-Wiki` (Layer 3b/6: Physical Conservation Laws)
7. `Idris2-Hadron` / `Idris2-Hadron-Wiki` (Layer 4b: Standard Model Confinement)
8. `Idris2-Chemistry` / `Idris2-Chemistry-Wiki` (Layer 5b: Molecular Kinetics)
9. `Idris2-Biology` / `Idris2-Biology-Wiki` (Layer 6: Biological Hierarchies & Active Inference)
10. `Idris2-Universe` / `Idris2-Universe-Wiki` (Layer 10: Cosmic Motive & Master Audit)
