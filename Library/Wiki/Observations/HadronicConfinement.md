# Hadronic QCD Color Confinement & 27-Cell Lattice Singlet Observation

## Overview & Theoretical Foundation

In Quantum Chromodynamics (QCD), quarks carry one of three color charges ($R, G, B$) and are strictly confined within color-singlet hadrons. In discrete chromogeometry, the 27-cell lattice ($\mathbb{F}_3^3$) partitions space into 9 Red, 9 Green, and 9 Blue cells corresponding to the Z-coordinate slices. A hadron state is color-neutral (a white singlet) if and only if the net color flux across all three sectors is identically balanced ($Q_R = Q_G = Q_B$).

---

## Executable Literate Idris2 Observation Code

```idris
module Wiki.Observations.HadronicConfinement

import Language.Reflection
import Core.BoxInt
import Core.ScaleTransform
import Core.VexelMaxel
import Math.LinAlgebra.TernaryClassifier
import Geometry.LatticeTopology
import Core.UniverseState
import Core.Multiset
import Core.UnixelFraction
import Core.TransformMultiset
import Data.Vect
import Data.Fin

%default total

||| The 3 fundamental QCD color charge sectors in Chromogeometry:
||| - RedColor   (Hyperbolic / Timelike flux)
||| - GreenColor (Parabolic / Lightlike null transport)
||| - BlueColor  (Elliptic / Spacelike confinement canvas)
public export
data ColorCharge = RedColor | GreenColor | BlueColor

public export
Eq ColorCharge where
  RedColor   == RedColor   = True
  GreenColor == GreenColor = True
  BlueColor  == BlueColor  = True
  _          == _          = False

public export
Show ColorCharge where
  show RedColor   = "Red"
  show GreenColor = "Green"
  show BlueColor  = "Blue"

||| Classifies each cell index in Fin 27 into its exact QCD Color Sector.
public export
cellColorSector : Fin 27 -> ColorCharge
cellColorSector idx =
  let c = fin27ToCoord idx
  in case coordZ c of
       Bit3MinusOne => RedColor
       Bit3Zero     => GreenColor
       Bit3PlusOne  => BlueColor

public export
tabulate27 : (Fin 27 -> a) -> Vect 27 a
tabulate27 = tabulate

||| A Hadronic Nucleon State (Proton / Neutron) spanning the 27-cell lattice.
public export
record HadronState where
  constructor MkHadronState
  latticeGrid : Vect 27 BoxInt

||| Creates a balanced Hadronic Ground State at Epoch 3.
public export
seedHadronEpoch3 : HadronState
seedHadronEpoch3 =
  let grid = tabulate27 (\idx => 
        case cellColorSector idx of
          RedColor   => intToBoxInt 1
          GreenColor => intToBoxInt 1
          BlueColor  => intToBoxInt 1)
  in MkHadronState grid

||| Computes the net color charge sum of a sector.
public export
sectorColorSum : ColorCharge -> HadronState -> BoxInt
sectorColorSum targetColor (MkHadronState grid) =
  let cells = filter (\idx => cellColorSector idx == targetColor) (allFins 27)
  in foldl (\acc, idx => acc + index idx grid) (intToBoxInt 0) cells
  where
    allFins : (n : Nat) -> List (Fin n)
    allFins Z = []
    allFins (S k) = FZ :: map FS (allFins k)

||| Color Neutrality (White / Singlet State) Predicate:
public export
isColorNeutral : HadronState -> Bool
isColorNeutral hadron =
  let r = sectorColorSum RedColor hadron
      g = sectorColorSum GreenColor hadron
      b = sectorColorSum BlueColor hadron
  in r == g && g == b

||| Total Hadronic Valence Flux: Sum of all 27 cells.
public export
totalHadronFlux : HadronState -> BoxInt
totalHadronFlux (MkHadronState grid) = sumField27 grid

||| Converts a HadronState into a 3D Boxel multiset.
public export
hadronStateToBoxel : HadronState -> Boxel
hadronStateToBoxel (MkHadronState grid) = field27ToBoxel grid

||| Ground-state Hadron Nucleon represented as a canonical 3D Boxel multiset.
public export
seedHadronBoxel : Boxel
seedHadronBoxel = hadronStateToBoxel seedHadronEpoch3

||| Validates QCD Color Neutrality directly on a 3D Boxel multiset:
public export
isHadronBoxelColorNeutral : Boxel -> Bool
isHadronBoxelColorNeutral b =
  let redSlice   = sliceBoxelZ 0 b
      greenSlice = sliceBoxelZ 1 b
      blueSlice  = sliceBoxelZ 2 b
      wRed   = totalMaxelWeight redSlice
      wGreen = totalMaxelWeight greenSlice
      wBlue  = totalMaxelWeight blueSlice
  in wRed == wGreen && wGreen == wBlue

||| A 4-Vexel Balance Array representing Hadronic Color Singlet Confinement:
public export
hadronSingletBalanceArray : BalanceArray 4
hadronSingletBalanceArray = MkBalanceArray [1, 1, 1, 0] [0, 0, 0, 1]

||| Audits that 3 color quark vexels balance the unified baryon singlet.
public export
auditHadronSingletBalanceProof : Bool
auditHadronSingletBalanceProof =
  let qR = MkVexel [(MkUnixel 1, intToBoxInt 9)]
      qG = MkVexel [(MkUnixel 2, intToBoxInt 9)]
      qB = MkVexel [(MkUnixel 3, intToBoxInt 9)]
      bSinglet = MkVexel [(MkUnixel 1, intToBoxInt 9), (MkUnixel 2, intToBoxInt 9), (MkUnixel 3, intToBoxInt 9)]
  in isBalanced [qR, qG, qB, bSinglet] hadronSingletBalanceArray &&
     isDisjointBalance hadronSingletBalanceArray

export
%macro
auditHadronSingletBalance : Elab (Wiki.Observations.HadronicConfinement.auditHadronSingletBalanceProof = True)
auditHadronSingletBalance = pure Refl

public export
ScaleTransform ColorCharge Nat where
  scaleTransform RedColor   = 1
  scaleTransform GreenColor = 2
  scaleTransform BlueColor  = 3

public export
InvertibleScaleTransform ColorCharge Nat where
  invertScaleTransform Z = RedColor
  invertScaleTransform (S Z) = RedColor
  invertScaleTransform (S (S Z)) = GreenColor
  invertScaleTransform (S (S (S _))) = BlueColor
```
