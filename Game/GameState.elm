module Game.GameState
  ( GameState
  , mkGameState
  , update
  ) where

import Game.Objects as Objects
import Game.Object exposing(Movable, Object)
import Game.Input exposing(Input)
import Game.Mario
import Game.Projectile
import Util.Vector exposing (Vector2F, mkVector2)

type alias GameState =
  { mario: Objects.Mario
  , objects: List (Movable (Object {}))
  }
  
mkGameState : GameState
mkGameState =
  { mario = Objects.mkMario
  , objects = []
  }


update : Input -> GameState -> GameState
update ({dt, keys, space} as input) =
  updateMario input
  >> updateProjectiles input
  >> shoot space

updateMario input state = { state | mario <- Game.Mario.update input state.mario }

updateProjectiles input state = { state | objects <- List.map2 Game.Projectile.update input state.objects }

shoot : Bool -> GameState -> GameState
shoot space state = if space then { state | objects <- (Objects.mkProjectile state.mario.pos (mkVector2 0 -1)) :: state.objects } else state
