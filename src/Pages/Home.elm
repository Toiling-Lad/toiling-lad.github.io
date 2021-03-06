module Pages.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Types exposing (Project)
import RemoteData exposing (WebData)
import Routing.Router exposing (projectPath, projectsPath)
import Styles.SharedStyles exposing (..)


{ id, class } =
    styleNamespace


homeView : WebData (List Project) -> Html Msg
homeView response =
    div [ id BodySection ]
        [ maybeList response
        , homeFooter
        ]


homeFooter : Html Msg
homeFooter =
    section
        [ id FooterSection ]
        [ p
            [ id FooterText
            ]
            [ text " Duis aute irure dolor in reprehenderit in voluptate "
            , a [ href "https://github.com/Toiling-Lad/toiling-lad.github.io" ]
                [ text "source"
                ]
            , text "!"
            ]
        ]


maybeList : WebData (List Project) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success projects ->
            list projects

        RemoteData.Failure error ->
            text (toString error)


list : List Project -> Html Msg
list projects =
    div []
        [ div [ id LandingSection ]
            [ div [ id Slogan ]
                [ text "Check these projects out!" ]
            ]
        , div [ id FlexContainer ]
            (List.map projectItem projects)
        ]


projectItem : Project -> Html Msg
projectItem project =
    let
        path =
            projectPath project.id
    in
        div
            [ id FlexItem
            ]
            [ div
                [ id ItemImage
                , style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ]
                ]
                [ a
                    [ id Overlay
                    , href path
                    , style
                        [ ( "transition", ".5s ease" )
                        , ( "text-decoration", "none" )
                        ]
                    ]
                    [ div
                        [ id TextCenter ]
                        [ text project.name ]
                    ]
                ]
            , div [ id WorkContainer ]
                [ a
                    [ href path
                    , id WorkTitle
                    ]
                    [ text project.name ]
                , div [ id WorkIntro ]
                    [ text project.intro ]
                , div [ id WorkTag ]
                    [ text project.tag ]
                ]
            ]
