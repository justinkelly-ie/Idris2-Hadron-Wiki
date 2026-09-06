module Wiki.Main

import System
import Wiki.HadronScaleTransformSpec
import Compound.HadronicConfinement
import Compound.StandardModel

%default total

0 prfHadron1 : (Compound.StandardModel.auditFullStandardModelCatalogProof = True)
prfHadron1 = auditStandardModelCatalog

0 prfHadron2 : (Compound.HadronicConfinement.auditHadronSingletBalanceProof = True)
prfHadron2 = auditHadronSingletBalance

main : IO ()
main = do
  putStrLn "========================================================"
  putStrLn "  IDRIS 2 HADRON WIKI VERIFICATION SUITE"
  putStrLn "========================================================"
  putStrLn "1. Standard Model & Confinement Audit Static Invariants:"
  if prop_standardModelCatalogValid && prop_hadronSingletBalanceValid
     then putStrLn "   [PASSED] Static Invariant Audits Clean!"
     else do
       putStrLn "   [FAILED] Static Invariant Audits Failed!"
       exitWith (ExitFailure 1)
  putStrLn ""
  putStrLn "2. Hadron ScaleTransform & Color Charge QuickCheck Specs:"
  p <- auditHadronScaleTransformSpecProof
  if p
     then putStrLn "   [PASSED] ScaleTransform & InvertibleScaleTransform Verified!"
     else do
       putStrLn "   [FAILED] QuickCheck Specs Failed!"
       exitWith (ExitFailure 1)
  putStrLn "========================================================"
  putStrLn "  HADRON WIKI VERIFICATION COMPLETE: ALL PASSED!"
  putStrLn "========================================================"
