Algo
----

http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames#Haskell

Exemple
-------

Gist : https://gist.github.com/j4/8117832

```haskell
import HSlippyMap

main = do                                                                             
  mapM (\(x,y) -> mapM (\y'-> print $ "http://openstreetmap.asi.mi/" ++ show z ++ "/" ++ show x ++ "/" ++ show y' ++ ".png") y) [(x,\
[(minimum [tymin, tymax])..(maximum [tymin,tymax])]) | x <- [(minimum [txmin, txmax])..(maximum [txmin, txmax])]]
  where
      min = tileFromLatLong 49.13 3.05 8
      max = tileFromLatLong 48.57 1.66 8
      txmin = tx min
      txmax = tx max
      tymax = ty min
      tymin = ty max
      z = tz min
̀``

Result :

```
ja@x220:~/codaz/HSlippyMap$ ./hsl | xargs wget -nv -O NULL --output-file osm.asi.log 
ja@x220:~/codaz/HSlippyMap$ cat osm.asi.log 
2013-12-24 22:04:46 URL:http://tile.openstreetmap.org/8/129/87.png [37753/37753] -> "NULL" [1]
2013-12-24 22:04:46 URL:http://tile.openstreetmap.org/8/129/88.png [36997/36997] -> "NULL" [1]
2013-12-24 22:04:46 URL:http://tile.openstreetmap.org/8/130/87.png [36749/36749] -> "NULL" [1]
2013-12-24 22:04:47 URL:http://tile.openstreetmap.org/8/130/88.png [35550/35550] -> "NULL" [1]
FINISHED --2013-12-24 22:04:47--
Total wall clock time: 0,7s
Downloaded: 4 files, 144K in 0,4s (364 KB/s)
```


Other exemple
-------------

```haskell
mapM (\z-> putStrLn $ show $ tileFromLatLong 12.3 3.3 z) [0..18]
```

```
http://tile.openstreetmap.org/0/0/0.png
http://tile.openstreetmap.org/1/1/0.png
http://tile.openstreetmap.org/2/2/1.png
http://tile.openstreetmap.org/3/4/2.png
http://tile.openstreetmap.org/4/8/5.png
http://tile.openstreetmap.org/5/16/11.png
http://tile.openstreetmap.org/6/32/22.png
http://tile.openstreetmap.org/7/64/44.png
http://tile.openstreetmap.org/8/129/88.png
http://tile.openstreetmap.org/9/259/176.png
http://tile.openstreetmap.org/10/518/352.png
http://tile.openstreetmap.org/11/1036/704.png
http://tile.openstreetmap.org/12/2073/1409.png
http://tile.openstreetmap.org/13/4147/2819.png
http://tile.openstreetmap.org/14/8295/5639.png
http://tile.openstreetmap.org/15/16590/11278.png
http://tile.openstreetmap.org/16/33181/22557.png
http://tile.openstreetmap.org/17/66362/45115.png
http://tile.openstreetmap.org/18/132725/90230.png
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
