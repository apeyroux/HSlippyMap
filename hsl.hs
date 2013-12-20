-- Exemple use HSlippyMap

import HSlippyMap

main = do
  mapM (\z-> putStrLn $ show $ tileFromLatLong lat long z) [0..18]
  where
    lat = 48.8152
    long = 2.2712
    z = 19
