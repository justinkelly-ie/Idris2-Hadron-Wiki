# Hadron ScaleTransform & Color Charge Homomorphism Verification

```idris
module Wiki.HadronScaleTransformSpec

import Core.BoxInt
import Core.ScaleTransform
import Compound.HadronicConfinement
import Compound.StandardModel
import Wiki.Generators
import public QuickCheck

%default total
```

## Observables and Homomorphism

We define an observable quantum projection for color charges:

```idris
public export
colorToNat : ColorCharge -> Nat
colorToNat RedColor   = 1
colorToNat GreenColor = 2
colorToNat BlueColor  = 3
```

## QuickCheck Verification Properties

```idris
public export
prop_scalePreservesColor : ColorCharge -> Bool
prop_scalePreservesColor c =
  let z : Nat = scaleTransform c
  in z > 0

public export
prop_invertScaleGalois : ColorCharge -> Bool
prop_invertScaleGalois c =
  let z : Nat = scaleTransform c
      c' : ColorCharge = invertScaleTransform z
  in c' == c

public export
prop_observablePreserved : ColorCharge -> Bool
prop_observablePreserved c =
  let z : Nat = scaleTransform c
  in z == colorToNat c

public export
prop_standardModelCatalogValid : Bool
prop_standardModelCatalogValid = auditFullStandardModelCatalogProof

public export
prop_hadronSingletBalanceValid : Bool
prop_hadronSingletBalanceValid = auditHadronSingletBalanceProof

public export
auditHadronScaleTransformSpecProof : IO Bool
auditHadronScaleTransformSpecProof = do
  let r1 = qc prop_scalePreservesColor
  let r2 = qc prop_invertScaleGalois
  let r3 = qc prop_observablePreserved
  pure (r1.pass == Just True && r2.pass == Just True && r3.pass == Just True)
```
