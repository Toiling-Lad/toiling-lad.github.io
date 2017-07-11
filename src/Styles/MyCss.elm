module Styles.MyCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)
import Styles.SharedStyles exposing (..)


type CssIds
    = HeaderSection
    | BodySection
    | FooterSection
    | NavContainer
    | FlexContainer
    | FlexHeader
    | FlexSecondaryHeader
    | FlexItem
    | ProjectContainer
    | ProjectImage
    | ProjectText
    | ProjectTitle
    | ProjectDescription


css : Stylesheet
css =
    (stylesheet << namespace styleNamespace.name)
        [ body
            [ position relative
            , minHeight (vh 100)
            ]
        , id HeaderSection
            [ position fixed
            , top (rem 0)
            , width (pct 100)
            , height headerHeight
            , backgroundColor colorNav
            , overflow hidden
            , zIndex 2
              -- , boxShadow5 (rem 0) (rem 0.5) (rem 0.5) (rem 0.01) colorLightGrey
            ]
        , id BodySection
            [ paddingTop headerHeight
            , backgroundColor colorWhite
            , paddingBottom footerHeight
            , maxWidth (rem 70)
            , margin auto
            , zIndex 1
            ]
        , id FooterSection
            [ position absolute
            , bottom (rem 0)
            , width (pct 100)
            , height footerHeight
            , backgroundColor colorLightGrey
            , zIndex 0
            ]
        , id NavContainer
            [ paddingLeft (rem 0.5)
            , paddingRight (rem 0.5)
            , color colorWhite
            , height (pct 100)
            ]
        , id FlexContainer
            [ padding (rem 0)
            , margin (rem 0)
            , width (pct 100)
            , listStyle none
            , display inlineFlex
            , alignItems center
            , justifyContent center
            , flexWrap wrap
            ]
        , id FlexHeader
            [ margin (rem 0.5)
            , flexGrow (num 1)
            , textAlign center
            , height (rem 8)
            , textDecoration none
            ]
        , id FlexSecondaryHeader
            [ margin (rem 0.5)
            , flexGrow (num 1)
            , textAlign center
            , height (rem 4)
            , textDecoration none
            ]
        , id FlexItem
            [ margin (rem 0.5)
            , border3 (rem 0.001) solid colorLightGrey
            , color transparent
            , flexGrow (num 1)
            , height (rem 17)
            , opacity (num 1)
            , minWidth (rem 20)
            , textAlign center
            , hover
                [ backgroundColor colorLightGrey
                , opacity (num 0.5)
                , color colorNav
                ]
            ]
        , id ProjectContainer
            [ padding (rem 0)
            , margin (rem 0)
            , width (pct 100)
            , listStyle none
            , flexGrow (num 1)
            , display inlineFlex
            , alignItems center
            , justifyContent center
            ]
        , id ProjectImage
            [ margin (rem 0.5)
            , border3 (rem 0.001) solid colorLightGrey
            , flexGrow (num 1)
            , height (rem 40)
            , width (rem 35)
            , textAlign center
            ]
        , id ProjectText
            [ margin (rem 0.5)
            , border3 (rem 0.001) solid colorLightGrey
            , flexGrow (num 1)
            , height (rem 40)
            , width (rem 25)
            ]
        , id ProjectTitle
            [ margin (rem 0.5)
            , textAlign center
            , color colorBlue
            ]
        , id ProjectDescription
            [ margin (rem 0.5)
            , textAlign left
            ]
        ]


rem : Float -> Rem
rem =
    Css.rem


zIndex : Int -> Style
zIndex i =
    property "z-index" <| toString i



-- CONSTANTS


primaryAccentColor : Color
primaryAccentColor =
    hex "ccffaa"


colorNav : Color
colorNav =
    hex "313131"


colorWhite : Color
colorWhite =
    hex "ffffff"


colorBlack : Color
colorBlack =
    hex "000000"


colorLightGrey : Color
colorLightGrey =
    hex "e7e7e7"


colorBlue : Color
colorBlue =
    hex "4286f4"


headerHeight : Rem
headerHeight =
    (rem 4)


footerHeight : Rem
footerHeight =
    (rem 15)
