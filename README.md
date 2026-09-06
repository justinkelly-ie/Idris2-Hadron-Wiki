# Idris2-Hadron-Wiki

[![Idris 2 Verification](https://img.shields.io/badge/Idris_2-0.8.0-blue.svg)](https://www.idris-lang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Verification suite and literate documentation chapter for **Idris2-Hadron**, formalizing color charge confinement, hadronic algebra, and Standard Model particle synthesis.

## Literate Observation Suites (16 Suites)

- **Hadronic Confinement**: 3-color quark vexels ($q_R, q_G, q_B$) balancing the baryon singlet via `BalanceArray 4`.
- **Standard Model Catalog**: Full electroweak and strong force vertex validation (QED annihilation, Weak beta decay, Higgs gauge decay).
- **Quark-Hadron Algebra**: Multiset quark-to-hadron functor & mass token conservation ($9+9+9=27$).
- **Meson & Heavy Meson Algebra**: 2-quark bound states ($\pi^\pm, K^\pm, J/\psi, \Upsilon$).
- **Hyperon & Exotic Multiquarks**: Strange baryons ($\Lambda^0, \Omega^-$), tetraquarks ($36$), pentaquarks ($45$), and H-dibaryons ($54$).
- **High-Energy Scattering**: Mandelstam invariants ($s, t, u$) & 2-to-2 scattering kinematics.
- **QGP Hadronization & Plasma Recombination**: Jet fragmentation ($g \to q\bar{q}$) & CMB photon decoupling ($p^+ + e^- \to H^0 + \gamma$).
- **Nucleosynthesis & Alpha Replication**: Big Bang Nucleosynthesis (BBN), 108-voxel Alpha core (${}^4\text{He}$), and Triple-Alpha Carbon/Phosphorus synthesis ladder.
- **Type-Indexed Multiset Synthesis**: Formal progression from Quarks ($9$) $\to$ Hadrons ($27$) $\to$ Alpha ($108$) $\to$ Carbon-12 ($324$).

## Verification & Build

To compile the literate verification suite and execute the test runner binary:

```bash
toolbox run -c fedora-toolbox-44 /var/home/justin/.local/bin/idris2 --build Idris2-Hadron-Wiki.ipkg
toolbox run -c fedora-toolbox-44 ./build/exec/lhadron-wiki
```

## Related Repositories

- [Idris2-Hadron](https://github.com/justinkelly-ie/Idris2-Hadron)
- [Idris2-Chemistry-Wiki](https://github.com/justinkelly-ie/Idris2-Chemistry-Wiki)
- [Idris2-Universe-Wiki](https://github.com/justinkelly-ie/Idris2-Universe-Wiki)
