module Pages.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Models exposing (Project)
import RemoteData exposing (WebData)


view : WebData (List Project) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Projects" ] ]


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
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Level" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map projectRow projects)
            ]
        ]


projectRow : Project -> Html Msg
projectRow project =
    tr []
        [ td [] [ text project.id ]
        , td [] [ text project.name ]
        , td [] [ text (toString project.level) ]
        , td []
            []
        ]
