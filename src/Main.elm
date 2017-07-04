module Main exposing (..)

import Models exposing (Model, initialModel)
import View exposing (view)
import Msgs exposing (Msg)
import Update exposing (update)
import Routing.Helpers exposing (fetchProjects)
import Navigation exposing (Location)
import Routing.Router


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.Router.parseLocation location
    in
        ( initialModel currentRoute, fetchProjects )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
