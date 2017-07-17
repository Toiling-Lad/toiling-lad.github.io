module Pages.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Models exposing (Project)
import RemoteData exposing (WebData)
import Routing.Router exposing (projectPath, projectsPath)
import Styles.SharedStyles exposing (..)


{ id } =
    styleNamespace


view : WebData (List Project) -> Html Msg
view response =
    div [ id BodySection ]
        [ maybeList response
        , homeFooter
        ]


homeFooter : Html Msg
homeFooter =
    section [ id FooterSection ]
        [ div [ id ContactSection ]
            [ a [ id FooterText ]
                [ text "Contact Information" ]
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
        widthValue =
            case project.width of
                1 ->
                    "10rem"

                2 ->
                    "20rem"

                3 ->
                    "30rem"

                4 ->
                    "40rem"

                _ ->
                    "20rem"

        path =
            projectPath project.id
    in
        div
            [ id FlexItem
            , style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ), ( "width", widthValue ) ]
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
