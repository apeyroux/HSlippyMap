-- HSlippyMap Exemple
import HSlippyMap

main = mapM (print . show . tileFromLatLong lat long) [0..18]
  where
      lat = 48.8152
      long = 2.2712
      z = 19