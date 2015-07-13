import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Window

import Game.Input
import Game.GameState exposing(GameState, update, mkGameState)

import Game.Object exposing(Movable,Object)
import Util.Vector exposing(Vector2F)


-- UPDATE --





-- DISPLAY
ngonify : Float -> List (Object a)  -> List Form
ngonify h = List.map (\{pos} -> ngon 3 10 |> filled (rgb 255 0 0) |> move (pos.x, pos.y + 62 - h/2))

render : (Int, Int) -> GameState -> Element
render (w',h') state =
  let (w,h) = (toFloat w', toFloat h')
      mario = state.mario
      verb = if | mario.pos.y  >  0 -> "jump"
                | mario.speed.x /= 0 -> "walk"
                | otherwise     -> "stand"
      src = "/imgs/mario/" ++ verb ++ "/" ++ mario.dir ++ ".gif"
  in collage w' h'
      ([ rect w h  |> filled (rgb 174 238 238)
      , rect w 50 |> filled (rgb 74 163 41)
                  |> move (0, 24 - h/2)
      , ngon 4 10
        |> filled (rgb 128 128 128)
        |> move (mario.pos.x, mario.pos.y + 62 - h/2)
      ] ++ ngonify h state.objects)

-- MARIO


main = Signal.map2 render Window.dimensions (Signal.foldp update mkGameState Game.Input.input)
