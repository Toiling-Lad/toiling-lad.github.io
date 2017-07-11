module View exposing (..)

import Html exposing (..)
import Models exposing (Model)
import Msgs exposing (Msg)
import Pages.Project
import Pages.Home
import RemoteData
import Styles.SharedStyles exposing (..)


{ id } =
    styleNamespace


view : Model -> Html Msg
view model =
    div []
        [ div [ id HeaderSection ]
            [ nav ]
        , div [ id BodySection ]
            [ page model ]
        , div [ id FooterSection ]
            [ footer ]
        ]


nav : Html Msg
nav =
    div [ id NavContainer ]
        []


footer : Html Msg
footer =
    div []
        []


page : Model -> Html Msg
page model =
    case model.route of
        Models.ProjectsRoute ->
            Pages.Home.view model.projects

        Models.ProjectRoute id ->
            projectPage model id

        Models.NotFoundRoute ->
            notFoundView


projectPage : Model -> String -> Html Msg
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
                        Pages.Project.view project model.projects

                    Nothing ->
                        Pages.Home.view model.projects

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
