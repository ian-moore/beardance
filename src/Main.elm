
module Main exposing (update, subscriptions, init)

--http://juliaheffernan.tumblr.com/post/30863290499/aaaaaaaaand-here-is-one-in-space

import Html exposing (..)
import Message exposing (..)
import Model exposing (..)
import View exposing (render)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = render
        , update = update
        , subscriptions = subscriptions
        }


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : (Model, Cmd Msg)
init = 
    (initialModel, Cmd.none)

