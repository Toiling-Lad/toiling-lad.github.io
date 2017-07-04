module Msgs exposing (..)

import Models exposing (Project)
import RemoteData exposing (WebData)


type Msg
    = OnFetchProjects (WebData (List Project))
