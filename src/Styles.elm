module Styles exposing (..)

import Css exposing (..)
import Html exposing (Attribute)
import Html.Attributes


rem : Float -> Rem
rem =
    Css.rem


zIndex : Int -> Style
zIndex i =
    property "z-index" <| toString i



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


colorNav : Color
colorNav =
    hex "313131"


headerHeight : Rem
headerHeight =
    (rem 4)


footerHeight : Rem
footerHeight =
    (rem 15)


defaultShadow : Style
defaultShadow =
    boxShadow4 (px 0) (px 2) (px 6) (rgba 0 0 0 0.1)


monospaceFont : List Style
monospaceFont =
    [ fontFamily monospace ]



-- ELEMENT STYLES


wrapper : List Style
wrapper =
    [ position relative
    , minHeight (vh 100)
    ]


headerSection : List Style
headerSection =
    [ position fixed
    , top (rem 0)
    , width (pct 100)
    , height headerHeight
    , backgroundColor colorNav
    , overflow hidden
    , zIndex 2
    ]


bodySection : List Style
bodySection =
    [ paddingTop headerHeight
    , backgroundColor colorWhite
    , paddingBottom footerHeight
    , maxWidth (rem 70)
    , margin auto
    , zIndex 1
    ]


footerSection : List Style
footerSection =
    [ position absolute
    , bottom (rem 0)
    , width (pct 100)
    , height footerHeight
    , backgroundColor colorLightGrey
    , zIndex 0
    ]


navContainer : List Style
navContainer =
    [ paddingLeft (rem 0.5)
    , paddingRight (rem 0.5)
    , color colorWhite
    , height (pct 100)
    ]


flexContainer : List Style
flexContainer =
    [ padding (rem 0)
    , margin (rem 0)
    , width (pct 100)
    , listStyle none
    , display inlineFlex
    , alignItems center
    , justifyContent center
    , flexWrap wrap
    ]


flexHeader : List Style
flexHeader =
    [ margin (rem 0.5)
    , flexGrow (num 1)
    , textAlign center
    , height (rem 8)
    , textDecoration none
    ]


flexSecondaryHeader : List Style
flexSecondaryHeader =
    [ margin (rem 0.5)
    , flexGrow (num 1)
    , textAlign center
    , height (rem 4)
    , textDecoration none
    ]


flexItem : Float -> List Style
flexItem itemWidth =
    [ margin (rem 0.5)
    , border3 (rem 0.001) solid colorLightGrey
    , flexGrow (num 1)
    , height (rem 17)
    , width (rem itemWidth)
    , textAlign center
    ]


projectContainer : List Style
projectContainer =
    [ padding (rem 0)
    , margin (rem 0)
    , width (pct 100)
    , listStyle none
    , flexGrow (num 1)
    , display inlineFlex
    , alignItems center
    , justifyContent center
    ]


projectImage : List Style
projectImage =
    [ margin (rem 0.5)
    , border3 (rem 0.001) solid colorLightGrey
    , flexGrow (num 1)
    , height (rem 40)
    , width (rem 35)
    , textAlign center
      -- , backgroundColor colorBlue
    ]


projectText : List Style
projectText =
    [ margin (rem 0.5)
    , border3 (rem 0.001) solid colorLightGrey
    , flexGrow (num 1)
    , height (rem 40)
    , width (rem 25)
    ]


projectTitle : List Style
projectTitle =
    [ margin (rem 0.5)
    , textAlign center
    , color colorBlue
    , hover
        [ color colorLightGrey ]
    ]


projectDescription : List Style
projectDescription =
    [ margin (rem 0.5)
    , textAlign left
    ]
