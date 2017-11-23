module Model exposing (..)


type DanceDirection
    = UpLeft
    | Down
    | LeftRight
    | UpRight


type alias Model =
    { keyPressed : Int
    , danceDirection : DanceDirection
    }


initialModel : Model
initialModel =
    { keyPressed = 0
    , danceDirection = Down
    }