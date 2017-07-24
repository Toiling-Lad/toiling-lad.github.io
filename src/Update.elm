module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model)
import Routing.Router exposing (parseLocation)
import Ports exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchProjects response ->
            ( { model | projects = response }, Cmd.none )

        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Ports.scrollToTop () )

        Msgs.OnScroll scrollProperties ->
            ( { model | scroll = scrollProperties }, Cmd.none )
