module Game.Objects(..) where

import Game.Object exposing (Object, Movable, ObjectState(Alive))
import Util.Vector exposing (Vector2F, nullVector2)

type alias Mario = Movable (Object
  { dir : String
  })
  
type alias Projectile = Movable (Object {})

mkMario : Mario
mkMario =
  { pos = nullVector2
  , speed = nullVector2
  , dir = "left"
  , state = Alive
  }

mkProjectile : Vector2F -> Vector2F -> Projectile
mkProjectile pos speed =
  { pos = pos
  , speed = speed
  , state = Alive
  }
