module Main exposing (..)

import Html exposing (Html, div, text, program)
import Models exposing (Model, initialModel)
import View exposing (view)
import Msgs exposing (Msg)
import Update exposing (update)
import Helpers exposing (fetchProjects)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchProjects )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
