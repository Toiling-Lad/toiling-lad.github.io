module Pages.Project exposing (..)

import Html exposing (..)
import Msgs exposing (Msg)
import Models exposing (Project, initialModel)
import Html.Attributes exposing (..)
import Routing.Router exposing (projectPath)
import Routing.Helpers exposing (getProjectById)
import RemoteData exposing (WebData)
import Carousel exposing (Carousel, fromList)
import Styles.SharedStyles exposing (..)


{ id } =
    styleNamespace


view : Project -> WebData (List Project) -> Html Msg
view project projects =
    maybeList project projects


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
                    div [ id ProjectContainer ]
                        [ btnPrevious carousel.previous projects
                        , projectItem project
                        , btnNext carousel.next projects
                        ]
    in
        div []
            [ div [ id FlexContainer ]
                [ secondaryHeader project ]
            , carouselView
            ]


projectItem : Project -> Html Msg
projectItem project =
    div
        [ id FlexContainer ]
        [ div [ id ProjectImage, style [ ( "background-image", "url(./img/" ++ project.img ++ ")" ) ] ]
            []
        , div [ id ProjectText ]
            [ div []
                [ h3 [ id ProjectDescriptionTitle ]
                    [ text "Description" ]
                ]
            , div [ id ProjectDescription ]
                [ text project.description ]
            ]
        ]


btnPrevious : String -> List Project -> Html Msg
btnPrevious projectName projects =
    let
        path =
            projectPath projectName

        previousProject =
            getProjectById projectName projects
    in
        div
            [ id PreviousProjectImage
            , style [ ( "background-image", "url(./img/" ++ previousProject.img ++ ")" ) ]
            ]
            [ a
                [ id Image
                , href path
                ]
                []
            ]


btnNext : String -> List Project -> Html Msg
btnNext projectName projects =
    let
        path =
            projectPath projectName

        nextProject =
            getProjectById projectName projects
    in
        div
            [ id NextProjectImage
            , style [ ( "background-image", "url(./img/" ++ nextProject.img ++ ")" ) ]
            ]
            [ a
                [ id Image
                , href path
                ]
                []
            ]


secondaryHeader : Project -> Html Msg
secondaryHeader project =
    div [ id ProjectTitle ]
        [ text project.name ]
