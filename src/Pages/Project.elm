module Pages.Project exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Types exposing (Project, Carousel)
import Routing.Router exposing (projectPath)
import Routing.Helpers exposing (getProjectById)
import RemoteData exposing (WebData)
import Carousel exposing (fromList)
import Styles.SharedStyles exposing (..)


{ id } =
    styleNamespace


projectView : Project -> WebData (List Project) -> Html Msg
projectView project projects =
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
                            [ projectContainer project
                            ]
                        , div [ id FooterSection ]
                            [ nextProject carousel.next projects
                            ]
                        ]
    in
        carouselView


projectContainer : Project -> Html Msg
projectContainer project =
    div
        []
        [ div [ id LandingSection ]
            [ div [ id ProjectTitle ]
                [ text project.description ]
            ]
        , div [ id FlexContainer ]
            [ div
                [ id FlexItem
                , style [ ( "width", "100%" ) ]
                ]
                [ div
                    [ id ItemImage
                    , style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ]
                    ]
                    []
                ]
            , div
                [ id FlexItem ]
                [ div
                    [ id ItemImage
                    , style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ]
                    ]
                    []
                ]
            , div
                [ id FlexItem ]
                [ div
                    [ id ItemImage
                    , style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ]
                    ]
                    []
                ]
            , div
                [ id FlexItem ]
                [ div
                    [ id ItemImage
                    , style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ]
                    ]
                    []
                ]
            , div [ id FlexItem ]
                [ div [ id ProjectText ]
                    [ text project.description
                    ]
                ]
            , div [ id FlexItem ]
                [ div [ id ProjectText ]
                    [ text project.description
                    ]
                ]
            , div
                [ id FlexItem ]
                [ div
                    [ id ItemImage
                    , style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ]
                    ]
                    []
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
            [ id FooterText
            , href path
            ]
            [ text "Next project" ]
