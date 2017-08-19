port module Ports exposing (..)

import Types exposing (ScrollProperties)


-- Scrolling


port scrollToTop : () -> Cmd msg


port onFeedScroll : (ScrollProperties -> msg) -> Sub msg
