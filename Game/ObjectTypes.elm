module Game.ObjectTypes
  (Mario
  ) where

import Game.Object exposing (Object, Movable)

type alias Mario = Movable (Object
  { dir : String
  })
