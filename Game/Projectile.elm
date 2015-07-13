module Game.Projectile
  (update)
  where
  
import Game.Input exposing(Input)
import Game.Objects exposing(Projectile)
import Game.Object exposing(update, ObjectState(Dead))

maxY = 10

outOfBounds : Projectile -> Projectile
outOfBounds p = if p.pos.y <= maxY then { p | state <- Dead } else p

update : Input -> Projectile -> Projectile
update {dt} =
  outOfBounds
  >> Game.Object.update dt