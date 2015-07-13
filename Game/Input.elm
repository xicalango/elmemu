module Game.Input
  ( Input
  , input
  ) where

import Signal exposing ((<~), (~))
import Keyboard
import Time exposing (fps)
import Util.Vector exposing (Vector2I)

type alias Input =
  { dt: Float
  , keys: Vector2I
  , space: Bool
  }

mkInput : Float -> Vector2I -> Bool -> Input
mkInput dt keys space = {dt=dt, keys=keys, space=space}

input = let delta = Signal.map (\t -> t/20) (fps 25)
        in  Signal.sampleOn delta (mkInput <~ delta ~ Keyboard.arrows ~ Keyboard.space)