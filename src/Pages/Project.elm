module Pages.Project exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msgs exposing (Msg)
import Models exposing (Project, initialModel)
import Routing.Router exposing (projectPath)
import Routing.Helpers exposing (getProjectById)
import RemoteData exposing (WebData)
import Carousel exposing (Carousel, fromList)
import Styles.SharedStyles exposing (..)


{ id } =
    styleNamespace


view : Project -> WebData (List Project) -> Html Msg
view project projects =
    div [ id BodySection ]
        [ maybeList project projects
        ]


projectFooter : Html Msg
projectFooter =
    div [ id ContactSection ]
        []


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
                    div []
                        [ div [ id ProjectContainer ]
                            [ projectView project
                            ]
                        , div [ id FooterSection ]
                            [ nextProject carousel.next projects
                            ]
                        ]
    in
        carouselView


projectView : Project -> Html Msg
projectView project =
    div
        []
        [ div [ id LandingSection ]
            [ div [ id ProjectTitle ]
                [ text project.description ]
            ]
        , div
            [ id ProjectImage, style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ] ]
            []
        , div [ id FlexContainer ]
            [ div [ id FlexItem ]
                [ div [ id ProjectDescription ]
                    [ text project.description
                    ]
                ]
            , div [ id FlexItem, style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ] ]
                []
            , div [ id FlexItem, style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ] ]
                []
            , div [ id FlexItem, style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ] ]
                []
            , div [ id FlexItem ]
                [ div [ id ProjectDescription ]
                    [ text project.description
                    ]
                ]
            ]
        ]


nextProject : String -> List Project -> Html Msg
nextProject projectName projects =
    let
        path =
            projectPath projectName

        nextProject =
            getProjectById projectName projects
    in
        a
            [ id FooterNext
            , href path
            , onClick (Msgs.ScrollTo "main")
            ]
            [ text "Next project" ]
