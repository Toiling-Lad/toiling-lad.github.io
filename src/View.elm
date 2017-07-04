module View exposing (..)

import Html exposing (Html, div, text)
import Models exposing (Model, ProjectId)
import Msgs exposing (Msg)
import Pages.Project
import Pages.Home
import RemoteData
import Styles exposing (..)


view : Model -> Html Msg
view model =
    div [ styles wrapper ]
        [ div [ styles headerSection ]
            [ text "Header" ]
        , div [ styles bodySection ]
            [ page model ]
        , div [ styles footerSection ]
            [ text "Footer" ]
        ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.ProjectsRoute ->
            Pages.Home.view model.projects

        Models.ProjectRoute id ->
            projectPage model id

        Models.NotFoundRoute ->
            notFoundView


projectPage : Model -> ProjectId -> Html Msg
projectPage model projectId =
    case model.projects of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success projects ->
            let
                maybeProject =
                    projects
                        |> List.filter (\project -> project.id == projectId)
                        |> List.head
            in
                case maybeProject of
                    Just project ->
                        Pages.Project.view project

                    Nothing ->
                        notFoundView

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
