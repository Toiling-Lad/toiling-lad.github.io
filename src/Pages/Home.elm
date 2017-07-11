module Pages.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href)
import Msgs exposing (Msg)
import Models exposing (Project)
import RemoteData exposing (WebData)
import Routing.Router exposing (projectPath, projectsPath)
import Styles.SharedStyles exposing (..)


{ id } =
    styleNamespace


view : WebData (List Project) -> Html Msg
view response =
    maybeList response


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
        [ div [ id FlexContainer ]
            [ header ]
        , div [ id FlexContainer ]
            (List.map projectItem projects)
        ]


projectItem : Project -> Html Msg
projectItem project =
    let
        path =
            projectPath project.id
    in
        a [ id FlexItem, href path ]
            [ div []
                [ text project.name ]
            ]


header : Html Msg
header =
    a [ id FlexHeader, href projectsPath ]
        [ h1 []
            [ text "Open-source projects" ]
        ]


secondaryHeader : Project -> Html Msg
secondaryHeader project =
    h2 [ id FlexSecondaryHeader ]
        [ text project.name ]
