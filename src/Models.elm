module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { projects : WebData (List Project)
    , route : Route
    , error : Maybe String
    }


initialModel : Route -> Model
initialModel route =
    { projects = RemoteData.Loading
    , route = route
    , error = Nothing
    }


type Route
    = ProjectsRoute
    | ProjectRoute String
    | NotFoundRoute


type alias Project =
    { id : String
    , name : String
    , description : String
    , img : String
    , width : Float
    }


new : Project
new =
    { id = "0"
    , name = ""
    , description = ""
    , img = ""
    , width = 1
    }
