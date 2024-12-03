module Pi exposing (piSFromN)

import Tuple exposing (pair)
import BigInt as I exposing (BigInt)
import BigRational as R exposing (BigRational)

 -- Ratio type for arbitrary precision
type alias Ratio = BigRational 

ratAddWhole : BigInt -> Ratio -> Ratio
ratAddWhole i r = R.fromBigInt i |> R.add r

 -- Calculators
getOddVals : Int -> List Int
getOddVals n = 
  let vs = List.map ((*) 2) (List.range 0 n)
  in List.map ((+) 1) vs

processVals : List (BigInt, BigInt) -> Ratio
processVals vals =
  case vals of
    []           -> R.fromInt 1
    (n,d) :: []  -> R.fromBigInts n d
    (n,d) :: rem -> R.div (R.fromBigInt n) (ratAddWhole d (processVals rem))

 -- Wrapper functions
pairBI : Int -> Int -> (BigInt, BigInt)
pairBI a b = pair (I.fromInt a) (I.fromInt b)

getDens : Int -> List Int
getDens n = getOddVals n

getNums : Int -> List Int
getNums n = 4 :: (List.map (\v -> v * v) (List.range 1 n))

getPiRatioFromN : Int -> Ratio
getPiRatioFromN n = processVals (List.map2 pairBI (getNums n) (getDens n))

 -- Main Functions
piFromN : Int -> (BigInt, BigInt)
piFromN n = R.toBigInts (getPiRatioFromN n)

piSFromN : Int -> (String, String, String)
piSFromN n =
  let (num, den) = piFromN n
  in (I.toString num, I.toString den, R.fromBigInts num den |> R.toDecimalString 20)
