module Msgs exposing (..)

import Models exposing (Project, ScrollProperties)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchProjects (WebData (List Project))
    | OnLocationChange Location
    | OnScroll ScrollProperties
