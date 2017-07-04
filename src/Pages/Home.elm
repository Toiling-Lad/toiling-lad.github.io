module Pages.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Models exposing (Project)
import RemoteData exposing (WebData)
import Routing.Router exposing (projectPath)
import Styles exposing (..)


view : WebData (List Project) -> Html Msg
view response =
    div [ styles container ]
        [ text "Container"
        , maybeList response
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
    div [ class "p2" ]
        [ div [] (List.map projectRow projects)
        ]


projectRow : Project -> Html Msg
projectRow project =
    tr []
        [ td [] [ text project.id ]
        , td [] [ text project.name ]
        , td [] [ text (toString project.level) ]
        , td []
            [ goToProjectBtn project ]
        ]


goToProjectBtn : Project -> Html.Html Msg
goToProjectBtn project =
    let
        path =
            projectPath project.id
    in
        a
            [ class "btn regular"
            , href path
            ]
            [ text "Go to Project" ]
