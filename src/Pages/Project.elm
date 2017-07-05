module Pages.Project exposing (..)

import Html exposing (..)
import Msgs exposing (Msg)
import Models exposing (Project)
import Styles exposing (..)
import Pages.Home exposing (header)
import Html.Attributes exposing (class, value, href)
import Routing.Router exposing (projectPath)


view : Project -> Html Msg
view model =
    div []
        [ form model
        ]


form : Project -> Html Msg
form project =
    div []
        [ div [ styles flexContainer ]
            [ Pages.Home.header ]
        , div [ styles flexContainer ]
            [ Pages.Home.secondaryHeader project ]
        , div [ styles projectContainer ]
            [ btnPrevious project
            , projectItem project
            , btnNext project
            ]
        ]


projectItem : Project -> Html Msg
projectItem project =
    div
        [ styles flexContainer ]
        [ div [ styles projectImage ]
            [ text "[IMG]"
            ]
        , div [ styles projectText ]
            [ div []
                [ h3 [ styles projectTitle ]
                    [ text "Description" ]
                ]
            , div [ styles projectDescription ]
                [ text project.description ]
            , div [ styles projectDescription ]
                [ text "-> TO GITHUB <-" ]
            ]
        ]


stringToInt : String -> Int
stringToInt str =
    Result.withDefault 0 (String.toInt str)


btnPrevious : Project -> Html Msg
btnPrevious project =
    let
        path =
            projectPath (toString ((stringToInt project.id) - 1))
    in
        a [ class "btn ml1 h1", href path ]
            [ i [ class "fa fa-caret-left" ] [] ]


btnNext : Project -> Html Msg
btnNext project =
    let
        path =
            projectPath (toString ((stringToInt project.id) + 1))
    in
        a [ class "btn ml1 h1", href path ]
            [ i [ class "fa fa-caret-right" ] [] ]
