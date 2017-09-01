module Main exposing (..)

import Types exposing (Model)
import Models exposing (initialModel)
import View exposing (view)
import Msgs exposing (Msg(OnLocationChange, OnScroll))
import Update exposing (update)
import Routing.Helpers exposing (fetchProjects)
import Navigation exposing (Location, program)
import Routing.Router exposing (parseLocation)
import Ports exposing (onFeedScroll)


main : Program Never Model Msg
main =
    program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        ( initialModel currentRoute, fetchProjects )


subscriptions : Model -> Sub Msg
subscriptions model =
    onFeedScroll OnScroll
