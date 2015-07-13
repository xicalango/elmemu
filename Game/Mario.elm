module Game.Mario
  ( update
  ) where
  
import Game.Objects exposing(Mario)
import Game.Input exposing (Input)
import Game.Object exposing (Object, Movable)

import Util.Vector exposing (Vector2I,(<~~))


walk : Vector2I -> Mario -> Mario
walk keys m = { m | speed <- toFloat <~~ keys
                  , dir <- if keys.x < 0 then "left" else
                           if keys.x > 0 then "right" else m.dir }

update : Input -> Mario -> Mario
update {dt, keys, space} =
  walk keys
  >> Game.Object.update dt
