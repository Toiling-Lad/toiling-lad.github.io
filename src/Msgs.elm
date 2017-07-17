module Msgs exposing (..)

import Models exposing (Project)
import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Dom


type Msg
    = OnFetchProjects (WebData (List Project))
    | OnLocationChange Location
    | ScrollTo String
    | ScrollToResult (Result Dom.Error ())
