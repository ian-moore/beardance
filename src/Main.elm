
module Main exposing (update, subscriptions, init)

--http://juliaheffernan.tumblr.com/post/30863290499/aaaaaaaaand-here-is-one-in-space

import Html exposing (..)
import Keyboard
import Message exposing (..)
import Model exposing (..)
import View exposing (render)


getDirectionForKeyCode : Keyboard.KeyCode -> Maybe DanceDirection
getDirectionForKeyCode code =
    case code of
        37 -> Just UpLeft
        39 -> Just UpRight
        40 -> Just LeftRight
        _ -> Nothing


update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case Debug.log "msg" msg of
        KeyDown code ->
            case getDirectionForKeyCode code of
                Just direction ->
                    { model 
                    | danceDirection = direction
                    } ! []
                Nothing ->
                    model ! []
        KeyUp code ->
            { model 
            | danceDirection = Down
            } ! []
        NoOp ->
            model ! []
        UpdateDirection direction ->
            { model 
            | danceDirection = direction
            } ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.downs KeyDown
        , Keyboard.ups KeyUp
        ]


init : (Model, Cmd Msg)
init = 
    (initialModel, Cmd.none)



main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = render
        , update = update
        , subscriptions = subscriptions
        }
