module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { projects : WebData (List Project)
    , route : Route
    , scroll : ScrollProperties
    , error : Maybe String
    }


initialModel : Route -> Model
initialModel route =
    { projects = RemoteData.Loading
    , route = route
    , scroll = initScroll
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
    , intro : String
    , tag : String
    }


initScroll : { clientHeight : Int, scrollHeight : Int, scrollTop : Int }
initScroll =
    { scrollTop = 0
    , scrollHeight = 0
    , clientHeight = 0
    }


type alias ScrollProperties =
    { scrollTop : Int
    , scrollHeight : Int
    , clientHeight : Int
    }
