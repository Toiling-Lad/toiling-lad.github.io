port module Ports exposing (..)

import Models exposing (ScrollProperties)


-- Scrolling


port scrollToTop : () -> Cmd msg


port onFeedScroll : (ScrollProperties -> msg) -> Sub msg
