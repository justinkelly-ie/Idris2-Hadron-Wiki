module Wiki.Main

import System
import Wiki.HadronScaleTransformSpec
import Compound.HadronicConfinement
import Compound.StandardModel

%default total

0 prfHadron1 : (Compound.StandardModel.auditFullStandardModelCatalogProof = True)
prfHadron1 = Refl

0 prfHadron2 : (Compound.HadronicConfinement.auditHadronSingletBalanceProof = True)
prfHadron2 = Refl

main : IO ()
main = do
  putStrLn "========================================================"
  putStrLn "  IDRIS 2 HARD HADRON ALGEBRA WIKI VERIFICATION SUITE"
  putStrLn "========================================================"
  putStrLn "1. Hadron Quark Multiset Confinement & Gauge Vertices:"
  if prop_standardModelCatalogValid && prop_hadronSingletBalanceValid
     then putStrLn "   [PASSED] Hadron Confinement & Color Neutrality Clean!"
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
