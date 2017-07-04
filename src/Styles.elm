module Styles exposing (..)

import Css exposing (..)
import Html exposing (Attribute)
import Html.Attributes
import Css exposing (..)


rem : Float -> Rem
rem =
    Css.rem



-- HELPERS


styles : List Style -> Attribute msg
styles =
    Css.asPairs >> Html.Attributes.style



-- CONSTANTS


colorLightGrey : Color
colorLightGrey =
    hex "e7e7e7"


colorOffWhite : Color
colorOffWhite =
    hex "fffef5"


colorLighten : Color
colorLighten =
    rgba 255 255 255 0.8


colorText : Color
colorText =
    hex "731c0d"


colorSalsa : Color
colorSalsa =
    hex "ff6347"


colorTaco : Color
colorTaco =
    hex "fff080"


colorWhite : Color
colorWhite =
    hex "ffffff"


colorBlue : Color
colorBlue =
    hex "4286f4"


headerHeight : Rem
headerHeight =
    (rem 4)


footerHeight : Rem
footerHeight =
    (rem 6)


defaultShadow : Style
defaultShadow =
    boxShadow4 (px 0) (px 2) (px 6) (rgba 0 0 0 0.1)


monospaceFont : List Style
monospaceFont =
    [ fontFamily monospace ]



-- ELEMENT STYLES


wrapper : List Style
wrapper =
    [ minHeight (vh 100)
    , position relative
    ]


headerSection : List Style
headerSection =
    [ backgroundColor colorBlue
    , height headerHeight
    ]


bodySection : List Style
bodySection =
    [ backgroundColor colorWhite
    , paddingBottom footerHeight
    ]


footerSection : List Style
footerSection =
    [ position absolute
    , bottom (rem 0)
    , width (pct 100)
    , height footerHeight
    , backgroundColor colorBlue
    ]


container : List Style
container =
    [ margin (rem 2)
    , backgroundColor colorTaco
    ]
