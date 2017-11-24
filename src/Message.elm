module Message exposing (..)

import Keyboard
import Model exposing (DanceDirection)

type Msg
    = NoOp
    | KeyDown Keyboard.KeyCode
    | KeyUp Keyboard.KeyCode
    | UpdateDirection DanceDirection