module HSlippyMap (
    Tile,
    tileFromLatLong,
    tileFromXY
) where

type Lat = Float
type Long = Float
type X = Integer
type Y = Integer
type ZLevel = Integer

data Tile = Tile {
  lat :: Lat,
  long :: Long,
  x :: X,
  y :: Y,
  z :: ZLevel }

instance Show Tile where
  show (Tile lat long x y z) = "http://tile.openstreetmap.org/" ++ show z ++ "/" ++ show x ++ "/" ++ show y ++ ".png"

tileFromLatLong :: Lat -> Long -> ZLevel -> Tile
tileFromLatLong lat lon z = Tile lat lon x y z
    where
        x = long2tilex lon z
        y = lat2tiley lat z

tileFromXY :: X -> Y -> ZLevel -> Tile
tileFromXY x y z = Tile lat lon x y z
    where
        lat = tilex2long x z
        lon = tiley2lat y z

long2tilex lon z = floor((lon + 180) / 360 * (2** fromInteger z::Long))

lat2tiley lat z = floor((1.0 - log( tan(lat * pi/180.0) + 1.0 / cos(lat * pi/180.0)) / pi) / 2.0 * (2 ** fromInteger z::Long))

tilex2long x z = (fromInteger x::Long) / (2.0 ** fromInteger z::Long) * 360.0 - 180

tiley2lat y z = 180.0 / pi * atan(0.5 * (exp n - exp(-n)))
    where
        n = pi - 2.0 * pi * (fromInteger y::Long) / (2.0 ** fromInteger z::Long)
