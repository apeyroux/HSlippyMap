http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames#Haskell

```haskell
mapM (\z-> putStrLn $ show $ tileFromLatLong 12.3 3.3 z) [0..18]
```


```haskell
long2tilex lon z = floor((lon + 180.0) / 360.0 * (2.0 ** z))
 
lat2tiley lat z = floor((1.0 - log( tan(lat * pi/180.0) + 1.0 / cos(lat * pi/180.0)) / pi) / 2.0 * (2.0 ** z))
 
tilex2long x z = x / (2.0 ** z) * 360.0 - 180
 
tiley2lat y z = 180.0 / pi * atan(0.5 * (exp(n) - exp(-n)))
        where
                n = pi - 2.0 * pi * y / (2.0 ** z)
 
-- Exemple
main = do
        --print $ long2tilex 2.2712 17
        --print $ lat2tiley 48.8152 17
        --print $ tilex2long 66362 17
        --print $ tiley2lat 45115 17
        putStrLn "gps: (lat=48.8152,long=2.2712)"
        putStrLn $ "http://tile.openstreetmap.org/17/" ++ show x ++ "/" ++ show y ++ ".png"
        where
                z = 17
                x = long2tilex 2.2712 z
                y = lat2tiley 48.8152 z
```
