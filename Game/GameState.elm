module Game.GameState
  ( Mario
  , GameState
  , newGameState
  ) where
  
import Game.Object exposing (..)
import Game.Mario exposing (Mario, mkMario)

import Util.Vector exposing (..)


type alias GameState =
  { mario: Mario
  , objects: List (Vector2F, Bool)
  }

type alias Input =
  { dt: Float
  , keys: Vector2I
  , space: Bool
  }
  
newGameState : GameState
newGameState =
  { mario = mkMario
  
  , objects = []
  }
