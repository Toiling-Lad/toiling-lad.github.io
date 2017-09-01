module Models exposing (..)

import RemoteData exposing (WebData)
import Types exposing (Model, Route, Project)


initialModel : Route -> Model
initialModel route =
    { projects = RemoteData.Loading
    , route = route
    , scroll = initScroll
    , error = Nothing
    }


initScroll : { clientHeight : Int, scrollHeight : Int, scrollTop : Int }
initScroll =
    { scrollTop = 0
    , scrollHeight = 0
    , clientHeight = 0
    }
