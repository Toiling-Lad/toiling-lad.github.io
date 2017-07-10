module Routing.Router exposing (..)

import Navigation exposing (Location)
import Models exposing (Route(..))
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map ProjectsRoute top
        , map ProjectRoute (s "projects" </> string)
        , map ProjectsRoute (s "projects")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


projectsPath : String
projectsPath =
    "#"


projectPath : String -> String
projectPath id =
    "#projects/" ++ id
