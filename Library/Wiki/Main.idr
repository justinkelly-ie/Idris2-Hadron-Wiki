module Wiki.Main

import System
import Language.Reflection
import Wiki.HadronScaleTransformSpec
import Wiki.Observations.HadronicConfinement
import Wiki.Observations.StandardModel
import Wiki.Observations.QuarkHadronAlgebra
import Wiki.Observations.MesonAlgebra
import Wiki.Observations.HeavyMesonAlgebra
import Wiki.Observations.HyperonAlgebra
import Wiki.Observations.ExoticMultiquark
import Wiki.Observations.ParticleScattering
import Wiki.Observations.HadronizationEngine
import Wiki.Observations.TypeIndexedMultiset
import Wiki.Observations.GaugeBosons
import Wiki.Observations.StellarNuclei
import Wiki.Observations.StellarNucleosynthesis
import Wiki.Observations.CosmicNucleosynthesis
import Wiki.Observations.PlasmaRecombination
import Wiki.Observations.AlphaReplication

%default total

0 prfHadron1 : (Wiki.Observations.StandardModel.auditFullStandardModelCatalogProof = True)
prfHadron1 = auditStandardModelCatalog

0 prfHadron2 : (Wiki.Observations.HadronicConfinement.auditHadronSingletBalanceProof = True)
prfHadron2 = auditHadronSingletBalance

0 prfHadron3 : (Wiki.Observations.TypeIndexedMultiset.auditTypeIndexedMultisetProof = True)
prfHadron3 = auditTypeIndexedMultiset

main : IO ()
main = do
  putStrLn "========================================================"
  putStrLn "  IDRIS 2 HARD HADRON ALGEBRA WIKI VERIFICATION SUITE"
  putStrLn "========================================================"
  putStrLn "1. Hadron Quark Multiset Confinement & Gauge Vertices:"
  if prop_standardModelCatalogValid && prop_hadronSingletBalanceValid &&
     auditQuarkHadronAlgebraProof && auditMesonAlgebraProof &&
     auditHeavyMesonAlgebraProof && auditHyperonAlgebraProof &&
     auditExoticMultiquarksProof && auditParticleScatteringProof &&
     auditHadronizationEngineProof && auditTypeIndexedMultisetProof &&
     auditGaugeBosonProof && auditStellarNucleiProof &&
     auditCompleteStellarFusionBalanceNetworkProof &&
     auditCosmicNucleosynthesisProof &&
     auditPlasmaRecombinationDecouplingProof &&
     auditTripleAlphaCarbonBalanceProof
     then putStrLn "   [PASSED] Hadron Confinement & All 16 Hadronic Suites Clean!"
     else do
       putStrLn "   [FAILED] Static Invariant Audits Failed!"
       exitWith (ExitFailure 1)
  putStrLn ""
  putStrLn "2. Hadron ScaleTransform (Coord2D -> BoxInt) QuickCheck Specs:"
  p <- auditHadronScaleTransformSpecProof
  if p
     then putStrLn "   [PASSED] Hadron ScaleTransform Verified!"
     else do
       putStrLn "   [FAILED] QuickCheck Specs Failed!"
       exitWith (ExitFailure 1)
  putStrLn "========================================================"
  putStrLn "  HADRON WIKI VERIFICATION COMPLETE: ALL PASSED!"
  putStrLn "========================================================"
