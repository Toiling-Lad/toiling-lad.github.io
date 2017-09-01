module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Route(ProjectsRoute, ProjectRoute, NotFoundRoute))
import Color exposing (..)
import Msgs exposing (Msg)
import Pages.Project exposing (projectView)
import Routing.Router exposing (projectPath, projectsPath)
import Pages.Home exposing (homeView)
import RemoteData exposing (RemoteData(NotAsked, Loading, Success, Failure))
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
                [ id NavIcon
                , href projectsPath
                ]
                [ svgIcon ]
            , a
                [ id NavTitle
                , href projectsPath
                ]
                [ text "My Projects"
                , errorView model.error
                ]
            ]


page : Model -> Html Msg
page model =
    case model.route of
        ProjectsRoute ->
            homeView model.projects

        ProjectRoute id ->
            projectPage model id

        NotFoundRoute ->
            notFoundView


projectPage : Model -> String -> Html Msg
projectPage model projectId =
    case model.projects of
        NotAsked ->
            Html.text ""

        Loading ->
            text "Loading ..."

        Success projects ->
            let
                maybeProject =
                    projects
                        |> List.filter (\project -> project.id == projectId)
                        |> List.head
            in
                case maybeProject of
                    Just project ->
                        projectView project model.projects

                    Nothing ->
                        homeView model.projects

        Failure err ->
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


navigationText : String -> Html msg
navigationText location =
    case location of
        "ProjectsRoute" ->
            svg
                [ id SvgIcon ]
                []

        _ ->
            svg [ id SvgIcon ]
                [ keyboard_arrow_backspace Color.black 25 ]
