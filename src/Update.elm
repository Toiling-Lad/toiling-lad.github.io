module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model)
import Routing.Router exposing (parseLocation)
import Dom.Scroll
import Dom
import Task


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
                ( { model | route = newRoute }, Cmd.none )

        Msgs.ScrollTo id ->
            ( model, Task.attempt Msgs.ScrollToResult (Dom.Scroll.toTop id) )

        Msgs.ScrollToResult result ->
            case result of
                Err (Dom.NotFound id) ->
                    ( { model | error = Just ("Could not find dom id: " ++ id) }, Cmd.none )

                Ok () ->
                    ( { model | error = Nothing }, Cmd.none )
