import HSlippyMap

main = do
  putStrLn $ show $ tileFromLatLong lat long z
  putStrLn $ show $ tileFromXY x y z
  where
      lat = 48.8152
      long = 2.2712
      x = 66362
      y = 45115
      z = 19
