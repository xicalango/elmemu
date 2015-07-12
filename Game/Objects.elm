module Game.Objects(..) where

import Game.Object exposing (Object, Movable, ObjectState(Alive))
import Util.Vector exposing (nullVector2)

type alias Mario = Movable (Object
  { dir : String
  })

mkMario : Mario
mkMario =
  { pos = nullVector2
  , speed = nullVector2
  , dir = "left"
  , state = Alive
  }
