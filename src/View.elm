module View exposing (render)


import Elmoji exposing (textWith, replaceWithTwemoji)
import Html exposing (..)
import Html.Attributes exposing (..)
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
    div [ class ("scene" ++ " " ++ bgClass) ]
        [ text ""
        ]


renderButton : String -> Msg -> Msg -> Html Msg
renderButton label keyDownMsg keyUpMsg =
    button [ class "button-direction" ]
        (textWith replaceWithTwemoji label)
        


renderScene : DanceDirection -> Html Msg
renderScene = getClassForDirection >> scene


render : Model -> Html Msg
render model =
    div [ class "container" ]
        [ h1 [ class "header" ] 
            [ text "Bear Dance" 
            ]
        , renderScene model.danceDirection
        , div [ class "button-container" ]
            [ renderButton "↖" NoOp NoOp -- up/left
            , renderButton "↔" NoOp NoOp -- left/right
            , renderButton "↗" NoOp NoOp -- up/right
            ]
        ]