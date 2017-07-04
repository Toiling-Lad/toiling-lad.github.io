module Pages.Project exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Msgs exposing (Msg)
import Models exposing (Project)


view : Project -> Html Msg
view model =
    div []
        [ form model
        ]


form : Project -> Html Msg
form project =
    div [ class "m3" ]
        [ h1 [] [ text project.name ]
        , formLevel project
        ]


formLevel : Project -> Html Msg
formLevel project =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Level" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString project.level) ]
            , btnLevelDecrease project
            , btnLevelIncrease project
            ]
        ]


btnLevelDecrease : Project -> Html Msg
btnLevelDecrease project =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-minus-circle" ] [] ]


btnLevelIncrease : Project -> Html Msg
btnLevelIncrease project =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-plus-circle" ] [] ]
