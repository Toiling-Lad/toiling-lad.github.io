module Update exposing (..)

import Msgs exposing (Msg(OnFetchProjects, OnLocationChange, OnScroll))
import Types exposing (Model)
import Routing.Router exposing (parseLocation)
import Ports exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnFetchProjects response ->
            ( { model | projects = response }, Cmd.none )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Ports.scrollToTop () )

        OnScroll scrollProperties ->
            ( { model | scroll = scrollProperties }, Cmd.none )
