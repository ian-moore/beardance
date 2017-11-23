module View exposing (render)


import Elmoji exposing (textWith, replaceWithTwemoji)
import Html exposing (..)
import Html.Attributes exposing (..)
import Message exposing (..)
import Model exposing (..)


getClassForDirection : DanceDirection -> String
getClassForDirection direction =
    case direction of
        Up -> "scene-bg-up"
        Down -> "scene-bg-down"
        Left -> "scene-bg-left"
        Right -> "scene-bg-right"


scene : String -> Html Msg
scene bgClass =
    div [ class ("scene" ++ " " ++ bgClass) ]
        [ text "insert bg img here"
        ]


renderButton : String -> Msg -> Html Msg
renderButton label msg =
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
            [ renderButton "↖" NoOp -- up/left
            , renderButton "↔" NoOp -- left/right
            , renderButton "↗" NoOp -- up/right
            ]
        ]