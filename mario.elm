import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Keyboard
import Time exposing (..)
import Window

import Game.GameState exposing (..)
import Util.Vector exposing (Vector2I)
import Game.Object


-- UPDATE --


step : Input -> GameState -> GameState
step ({dt, keys, space} as input) state =
  { state | mario <- stepMario input state.mario }
  |> shoot space



shoot : Bool -> GameState -> GameState
shoot space state = if space then { state | objects <- ({x=state.mario.pos.x, y=state.mario.pos.y}, True) :: state.objects } else state



-- DISPLAY
ngonify : Float -> List {x: Float, y: Float} -> List Form
ngonify h = List.map (\{x,y} -> ngon 3 10 |> filled (rgb 255 0 0) |> move (x, y + 62 - h/2))

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
      ] ++ ngonify h (List.map fst state.objects))

-- MARIO
input = let delta = Signal.map (\t -> t/20) (fps 25)
        in  Signal.sampleOn delta (Signal.map3 (,,) delta Keyboard.arrows Keyboard.space)

main = Signal.map2 render Window.dimensions (Signal.foldp step newGameState input)
