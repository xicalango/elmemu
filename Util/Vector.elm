module Util.Vector
  ( Vector2
  , Vector2I
  , Vector2F
  , mkVector2
  , (<~~)
  , v2map
  , v2extend

  , Vector3
  , Vector3I
  , Vector3F
  , mkVector3
  , v3map
  
  ) where


type alias Vector2 a = {x: a, y: a}
type alias Vector3 a = {x: a, y: a, z: a}

type alias Vector2I = Vector2 Int
type alias Vector2F = Vector2 Float

type alias Vector3I = Vector3 Int
type alias Vector3F = Vector3 Float


mkVector2 : a -> a -> Vector2 a
mkVector2 x y = {x=x, y=y}

mkVector3 : a -> a -> a -> Vector3 a
mkVector3 x y z = {x=x, y=y, z=z}

v2map : (a -> b) -> Vector2 a -> Vector2 b
v2map f v = {x = f v.x, y = f v.y}

(<~~) = v2map

v3map : (a -> b) -> Vector3 a -> Vector3 b
v3map f v =
  { x = f v.x
  , y = f v.y
  , z = f v.z }

v2extend : Vector2 a -> a -> Vector3 a
v2extend v z = {x=v.x, y=v.y, z=z}
