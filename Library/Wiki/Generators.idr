module Wiki.Generators

import public QuickCheck
import Compound.HadronicConfinement
import Compound.StandardModel
import Core.BoxInt

%default total

public export
natToColorCharge : Nat -> ColorCharge
natToColorCharge Z = RedColor
natToColorCharge (S Z) = GreenColor
natToColorCharge (S (S _)) = BlueColor

public export
Arbitrary ColorCharge where
  arbitrary = map natToColorCharge arbitrary

  coarbitrary RedColor gen   = coarbitrary (the Nat 0) gen
  coarbitrary GreenColor gen = coarbitrary (the Nat 1) gen
  coarbitrary BlueColor gen  = coarbitrary (the Nat 2) gen

public export
natToFermion : Nat -> Fermion
natToFermion Z = QuarkU
natToFermion (S Z) = QuarkD
natToFermion (S (S Z)) = QuarkC
natToFermion (S (S (S Z))) = QuarkS
natToFermion (S (S (S (S Z)))) = QuarkT
natToFermion (S (S (S (S (S Z))))) = QuarkB
natToFermion (S (S (S (S (S (S Z)))))) = AntiQuarkU
natToFermion (S (S (S (S (S (S (S Z))))))) = AntiQuarkD
natToFermion (S (S (S (S (S (S (S (S Z)))))))) = LepE
natToFermion (S (S (S (S (S (S (S (S (S Z))))))))) = LepNuE
natToFermion (S (S (S (S (S (S (S (S (S (S _)))))))))) = AntiLepE

public export
Arbitrary Fermion where
  arbitrary = map natToFermion arbitrary

  coarbitrary f gen = coarbitrary (the Nat 0) gen

public export
natToBoson : Nat -> Boson
natToBoson Z = Photon
natToBoson (S Z) = WPlus
natToBoson (S (S Z)) = WMinus
natToBoson (S (S (S Z))) = ZZero
natToBoson (S (S (S (S _)))) = Higgs0

public export
Arbitrary Boson where
  arbitrary = map natToBoson arbitrary

  coarbitrary b gen = coarbitrary (the Nat 0) gen

public export
Arbitrary StandardModelParticle where
  arbitrary = do
    b <- arbitrary {a = Bool}
    if b then map SMPFermion arbitrary else map SMPBoson arbitrary

  coarbitrary (SMPFermion f) gen = coarbitrary f gen
  coarbitrary (SMPBoson b) gen   = coarbitrary b gen

public export
qc : (Arbitrary a, Show a, Testable prop) => (a -> prop) -> QCRes
qc f = quickCheck (MkFn f)

public export
qc2 : (Arbitrary a, Show a, Arbitrary b, Show b, Testable prop) => (a -> b -> prop) -> QCRes
qc2 f = quickCheck (MkFn (\x => MkFn (f x)))
