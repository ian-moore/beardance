module View exposing (render)


import Elmoji exposing (textWith, replaceWithTwemoji)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Message exposing (..)
import Model exposing (..)


getClassForDirection : DanceDirection -> String
getClassForDirection direction =
    case direction of
        UpLeft -> "scene-up-left"
        Down -> "scene-down"
        LeftRight -> "scene-left-right"
        UpRight -> "scene-up-right"


scene : String -> Html Msg
scene bgClass =
    div [ class ("scene" ++ " " ++ bgClass) ] []


onTouchStart : msg -> Attribute msg
onTouchStart message =
    on "touchstart" (Json.succeed message)


onTouchEnd : msg -> Attribute msg
onTouchEnd message =
    on "touchend" (Json.succeed message)


renderButton : String -> Msg -> Msg -> Html Msg
renderButton label pressMsg releaseMsg =
    button
        [ class "button-direction" 
        , onMouseDown pressMsg
        , onMouseUp releaseMsg
        , onTouchStart pressMsg
        , onTouchEnd releaseMsg
        ]
        ([ div [ class "button-direction-overlay" ] []
        ] ++ (textWith replaceWithTwemoji label))
        


renderScene : DanceDirection -> Html Msg
renderScene = getClassForDirection >> scene


defaultMsg : Msg
defaultMsg = (UpdateDirection Down)


render : Model -> Html Msg
render model =
    div [ class "container" ]
        [ h1 [ class "header" ] 
            [ text "Space Bear" 
            ]
        , renderScene model.danceDirection
        , div [ class "button-container" ]
            [ renderButton "↖" (UpdateDirection UpLeft) defaultMsg
            , renderButton "↔" (UpdateDirection LeftRight) defaultMsg
            , renderButton "↗" (UpdateDirection UpRight) defaultMsg
            ]
        ]