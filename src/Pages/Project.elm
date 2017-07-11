module Pages.Project exposing (..)

import Html exposing (..)
import Msgs exposing (Msg)
import Models exposing (Project, initialModel)
import Styles exposing (..)
import Pages.Home exposing (header)
import Html.Attributes exposing (class, value, href)
import Routing.Router exposing (projectPath)
import RemoteData exposing (WebData)
import Carousel exposing (Carousel, fromList)


view : Project -> WebData (List Project) -> Html Msg
view project projects =
    div []
        [ maybeList project projects
        ]


maybeList : Project -> WebData (List Project) -> Html Msg
maybeList project response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success projects ->
            form project projects

        RemoteData.Failure error ->
            text (toString error)


testItem : String -> Html Msg
testItem testValue =
    let
        path =
            projectPath testValue
    in
        a [ href path ]
            [ text testValue
            ]


form : Project -> List Project -> Html Msg
form project projects =
    let
        carouselList =
            (List.map (\a -> a.id) projects)

        carouselView =
            case fromList project.id carouselList of
                Err message ->
                    div []
                        [ text message ]

                Ok carousel ->
                    div [ styles projectContainer ]
                        [ btnPrevious carousel.previous
                        , projectItem project
                        , btnNext carousel.next
                        ]
    in
        div []
            [ div [ styles flexContainer ]
                [ Pages.Home.header ]
            , div [ styles flexContainer ]
                [ Pages.Home.secondaryHeader project ]
            , carouselView
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


btnPrevious : String -> Html Msg
btnPrevious project =
    let
        path =
            projectPath project
    in
        a [ class "btn ml1 h1", href path ]
            [ i [ class "fa fa-caret-left" ] [] ]


btnNext : String -> Html Msg
btnNext project =
    let
        path =
            projectPath project
    in
        a
            [ class "btn ml1 h1", href path ]
            [ i [ class "fa fa-caret-right" ] []
            ]
