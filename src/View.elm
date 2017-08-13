module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Color exposing (..)
import Msgs exposing (Msg)
import Pages.Project
import Routing.Router exposing (projectPath, projectsPath)
import Pages.Home
import RemoteData
import Styles.SharedStyles exposing (..)
import Material.Icons.Hardware exposing (keyboard_arrow_backspace)
import Svg exposing (svg)


{ id, class } =
    styleNamespace


view : Model -> Html Msg
view model =
    div []
        [ div [ id HeaderSection ]
            [ nav model ]
        , page model
        ]


nav : Model -> Html Msg
nav model =
    let
        svgIcon =
            navigationText (toString model.route)
    in
        div
            [ id NavContainer
            ]
            [ a
                [ id NavTitle
                , href projectsPath
                ]
                [ svgIcon
                , text "projects"
                , errorView model.error
                ]
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


projectPage : Model -> String -> Html Msg
projectPage model projectId =
    case model.projects of
        RemoteData.NotAsked ->
            Html.text ""

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


errorView : Maybe String -> Html msg
errorView error =
    case error of
        Just errorMsg ->
            text errorMsg

        Nothing ->
            text ""


navigationText location =
    case location of
        "ProjectsRoute" ->
            svg
                [ id SvgIcon ]
                []

        _ ->
            svg [ id SvgIcon ]
                [ keyboard_arrow_backspace Color.black 25 ]
