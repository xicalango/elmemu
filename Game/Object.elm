module Game.Object
  ( Object
  , ObjectState(..)
  , Movable
  , update
  , isAlive
  ) where
  
import Util.Vector exposing (..)

type ObjectState
  = Alive
  | Dead

type alias Object a =
  { a
  | pos: Vector2F
  , state: ObjectState
  }

type alias Movable a =
  { a
  | speed: Vector2F
  }

isAlive : Object a -> Bool
isAlive o = o.state == Alive

moving : Movable (Object a) -> Bool
moving o = o.speed.x /= 0 || o.speed.y /= 0

update : Float -> Movable (Object a) -> Movable (Object a)
update dt o =
  if moving o
  then { o | pos <- updatePosSpeed dt o.speed o.pos }
  else o


updatePosSpeed : Float -> Vector2F -> Vector2F -> Vector2F
updatePosSpeed dt speed pos = { pos | x <- pos.x + dt * speed.x
                                    , y <- pos.y + dt * speed.y
                                    }