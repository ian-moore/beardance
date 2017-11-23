module Model exposing (..)


type DanceDirection
    = Up
    | Down
    | Left
    | Right


type alias Model =
    { keyPressed : Int
    , danceDirection : DanceDirection
    }


initialModel : Model
initialModel =
    { keyPressed = 0
    , danceDirection = Down
    }