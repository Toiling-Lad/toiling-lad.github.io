module Styles.MyCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)
import Styles.SharedStyles exposing (..)


type CssIds
    = HeaderSection
    | BodySection
    | FooterSection
    | LandingSection
    | ContactSection
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
    | ProjectDescriptionTitle
    | NextProjectImage
    | PreviousProjectImage
    | TextCenter
    | Image
    | Overlay
    | NavTitle
    | Slogan
    | FooterText
    | FooterNext


css : Stylesheet
css =
    (stylesheet << namespace styleNamespace.name)
        [ body
            [ position relative
            , minHeight (vh 100)
            , backgroundColor colorBlack
            , overflowY scroll
            ]
        , id HeaderSection
            [ position fixed
            , top (rem 0)
            , width (pct 100)
            , height headerHeightLarge
            , overflow hidden
            , zIndex 2
            ]
        , id BodySection
            [ paddingTop headerHeightLarge
            , backgroundColor colorWhite
            , paddingBottom footerHeight
            , margin auto
            , zIndex 1
            ]
        , id FooterSection
            [ position absolute
            , bottom (rem 0)
            , width (pct 100)
            , height footerHeight
            , backgroundColor colorBlack
            , zIndex 0
            ]
        , id LandingSection
            [ height (vh 80)
            ]
        , id ContactSection
            [ backgroundColor colorWhite
            , height (pct 100)
            ]
        , id NavContainer
            [ padding (rem 2)
            , height (pct 100)
            , backgroundColor transparent
            ]
        , id FlexContainer
            [ margin (rem 0)
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
            [ margin (rem 2)
            , position relative
            , backgroundSize cover
            , backgroundPosition center
            , flexGrow (num 1)
            , height (rem 25)
            , minWidth (rem 30)
              -- , border3 (px 1) solid colorGrey
            , textAlign center
            ]
        , id ProjectContainer
            [ padding (rem 0)
            , margin (rem 0)
            , width (pct 100)
            , listStyle none
            , flexGrow (num 1)
            , display inlineFlex
            , justifyContent center
            ]
        , id ProjectImage
            [ margin (rem 2)
            , position relative
            , backgroundSize cover
            , backgroundPosition center
            , flexGrow (num 1)
            , height (rem 50)
              -- , border3 (px 1) solid colorGrey
            ]
        , id PreviousProjectImage
            [ marginTop (rem 2)
            , backgroundSize cover
            , backgroundPosition center
            , flexGrow (num 1)
            , height (rem 9)
            , right (rem 1.5)
            , minWidth (rem 2.5)
            , border3 (px 1) solid colorGrey
            ]
        , id NextProjectImage
            [ marginTop (rem 2)
            , backgroundSize cover
            , backgroundPosition center
            , flexGrow (num 1)
            , height (rem 9)
            , left (rem 1.5)
            , minWidth (rem 2.5)
            , border3 (px 1) solid colorGrey
            ]
        , id ProjectText
            [ margin (rem 1)
            , flexGrow (num 1)
            , width (rem 20)
            ]
        , id ProjectTitle
            [ position relative
            , color colorBlack
            , display block
            , margin auto
            , width (pct 40)
            , textAlign center
            , top (pct 40)
            , fontSize (rem 1.5)
            , textDecoration none
            ]
        , id ProjectDescriptionTitle
            [ margin (rem 0.5)
            , textAlign left
            , fontSize (rem 1.5)
            , paddingBottom (rem 1)
            ]
        , id ProjectDescription
            [ position relative
            , color colorBlack
            , display block
            , margin auto
            , width (pct 40)
            , textAlign center
            , top (pct 40)
            , fontSize (rem 1.25)
            , lineHeight (num 1.75)
            , textDecoration none
            ]
        , id TextCenter
            [ position relative
            , textAlign center
            , color colorBlack
            , top (pct 50)
            , textDecoration none
            , fontSize (rem 2)
            ]
        , id Image
            [ display block
            , alignSelf center
            , width (pct 100)
            , height (pct 100)
            , overflow visible
            ]
        , id Overlay
            [ position absolute
            , top (rem 0)
            , bottom (rem 0)
            , left (rem 0)
            , right (rem 0)
            , height (pct 100)
            , width (pct 100)
            , opacity (num 0)
            , backgroundColor colorTransparent
            , hover
                [ opacity (num 1)
                ]
            ]
        , id NavTitle
            [ position relative
            , textAlign left
            , color colorBlack
            , top (pct 25)
            , textDecoration none
            , paddingTop (rem 1)
            , paddingBottom (rem 1)
            , fontSize (rem 2)
            ]
        , id Slogan
            [ position relative
            , textAlign center
            , color colorBlack
            , display block
            , top (pct 40)
            , textDecoration none
            , fontSize (rem 5)
            ]
        , id FooterText
            [ position relative
            , textAlign center
            , color colorBlack
            , display block
            , top (pct 40)
            , textDecoration none
            , fontSize (rem 5)
            ]
        , id FooterNext
            [ position relative
            , textAlign center
            , color colorWhite
            , display block
            , top (pct 40)
            , textDecoration none
            , fontSize (rem 5)
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


colorGrey : Color
colorGrey =
    hex "e6eaea;"


colorTransparent : Color
colorTransparent =
    rgba 255 255 255 0.8


colorBlue : Color
colorBlue =
    hex "4286f4"


headerHeightLarge : Rem
headerHeightLarge =
    (rem 6)


footerHeight : Rem
footerHeight =
    (rem 25)
