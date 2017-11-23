module Model exposing (..)


type DanceDirection
    = UpLeft
    | Down
    | LeftRight
    | UpRight


type alias Model =
    { pressedKeys : Int
    , danceDirection : DanceDirection
    }


initialModel : Model
initialModel =
    { pressedKeys = 0
    , danceDirection = Down
    }