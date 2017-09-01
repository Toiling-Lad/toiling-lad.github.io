module Types exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { projects : WebData (List Project)
    , route : Route
    , scroll : ScrollProperties
    , error : Maybe String
    }


type alias ScrollProperties =
    { scrollTop : Int
    , scrollHeight : Int
    , clientHeight : Int
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


type alias Carousel a =
    { previous : a
    , current : a
    , next : a
    , rest : List a
    }
