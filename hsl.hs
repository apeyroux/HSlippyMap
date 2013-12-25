-- HSlippyMap Exemple
import HSlippyMap

{--
let max = tileFromLatLong 48.9031 2.5214 10
let min = tileFromLatLong 48.8146 2.1732 10
mapM (\(x,y) -> mapM (\y'-> print $ "http://tile.openstreetmap.org/" ++ show z ++ "/" \
++ show x ++ "/" ++ show y' ++ ".png") y) [(x,[(minimum [tymin, tymax])..(maximum [tymin\
,tymax])]) | x <- [(minimum [txmin, txmax])..(maximum [txmin, txmax])]]
--}

main = do 
  --mapM (print . show . tileFromLatLong lat long) [0..18]
  mapM (\(x,y) -> mapM (\y'-> 
      print $ "http://tile.openstreetmap.org/" ++ show z ++ "/" ++ show x ++ "/" ++ show y' ++ ".png") y) 
      [(x,[(minimum [tymin, tymax])..(maximum [tymin,tymax])]) | x <- [(minimum [txmin, txmax])..(maximum [txmin, txmax])]]
  where
      min = tileFromLatLong 49.13 3.05 8
      max = tileFromLatLong (-48.57) 1.66 8
      txmin = tx min
      txmax = tx max
      tymax = ty min
      tymin = ty max
      z = tz min
