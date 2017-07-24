module Routing.Helpers exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (Project)
import RemoteData.Http


fetchProjects : Cmd Msg
fetchProjects =
    RemoteData.Http.get fetchProjectsUrl Msgs.OnFetchProjects projectsDecoder


fetchProjectsUrl : String
fetchProjectsUrl =
    "/api/db.json"


projectsDecoder : Decode.Decoder (List Project)
projectsDecoder =
    Decode.list projectDecoder


projectDecoder : Decode.Decoder Project
projectDecoder =
    decode Project
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "description" Decode.string
        |> required "img" Decode.string
        |> required "width" Decode.float
        |> required "intro" Decode.string
        |> required "tag" Decode.string


{-|
    getProjectById "1" [{id = "1", name = "project A", description = "Lorem..", img = "asdads", width = 1 }, {id = "2", name = "project B", description = "Lorem..", img = "asdads", width = 2 }]
    --> {id = "1", name = "project A", description = "Lorem..", img = "asdads", width = 1 }

-}
getProjectById : String -> List Project -> Project
getProjectById projectId projects =
    let
        list =
            (List.filter (\b -> (b.id == projectId)) projects)

        getProject =
            case List.head list of
                Just project ->
                    project

                Nothing ->
                    { id = "nothing", name = "nothing", description = "nothing", img = "nothing", width = 0, intro = "nothing", tag = "nothing" }
    in
        getProject
