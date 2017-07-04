module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { projects : WebData (List Project)
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { projects = RemoteData.Loading
    , route = route
    }


type Route
    = ProjectsRoute
    | ProjectRoute ProjectId
    | NotFoundRoute


type alias ProjectId =
    String


type alias Project =
    { id : ProjectId
    , name : String
    , level : Int
    }


new : Project
new =
    { id = "0"
    , name = ""
    , level = 1
    }
