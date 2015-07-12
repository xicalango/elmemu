module Game.Mario
  ( Mario
  , mkMario
  , update
  ) where
  
import Game.GameState exposing (Input)
import Game.ObjectTypes exposing (Mario)
import Game.Object exposing (Object, Movable)
import Util.Vector exposing (..)



mkMario : Mario
mkMario =
  { pos = mkVector2 0 0
  , speed = mkVector2 0 0
  , dir = "left"
  , state = mkAlive
  }

walk : Vector2I -> Mario -> Mario
walk keys m = { m | speed <- toFloat <~~ keys
                  , dir <- if keys.x < 0 then "left" else
                           if keys.x > 0 then "right" else m.dir }

update : Input -> Mario -> Mario
update {dt, keys, space} =
  walk keys
  >> Game.Object.update dt
