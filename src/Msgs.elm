module Msgs exposing (..)

import Models exposing (Project)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchProjects (WebData (List Project))
    | OnLocationChange Location
