module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { projects : WebData (List Project)
    }


initialModel : Model
initialModel =
    { projects = RemoteData.Loading
    }


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
