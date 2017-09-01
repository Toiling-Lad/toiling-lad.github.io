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
    | FlexContainer
    | FlexHeader
    | FlexSecondaryHeader
    | FlexItem
    | ItemImage
    | NavContainer
    | ProjectContainer
    | ProjectImage
    | ProjectText
    | ProjectTitle
    | WorkContainer
    | WorkTitle
    | WorkIntro
    | WorkTag
    | ProjectDescriptionTitle
    | TextCenter
    | Image
    | Overlay
    | NavTitle
    | NavIcon
    | Slogan
    | FooterText
    | FooterNext
    | SvgIcon


css : Stylesheet
css =
    (stylesheet << namespace styleNamespace.name)
        [ body
            [ position relative
            , minHeight fullHeight
            , backgroundColor colorWhite
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
            , paddingBottom fullHeight
            , margin auto
            , zIndex 1
            ]
        , id FooterSection
            [ position absolute
            , bottom (rem 0)
            , width (pct 100)
            , height fullHeight
            , backgroundColor colorWhite
            , zIndex 0
            , padding gapWidth
            , displayFlex
            , alignItems center
            , justifyContent center
            ]
        , id LandingSection
            [ height fullHeight
            , padding gapWidth
            , displayFlex
            , alignItems center
            , justifyContent center
            ]
        , id ContactSection
            [ backgroundColor colorWhite
            , height (pct 100)
            ]
        , id NavContainer
            [ padding gapWidth
            , height (pct 100)
            , displayFlex
            , alignItems center
            , justifyContent center
            , backgroundColor colorTransparent
            ]
        , id FlexContainer
            [ margin (rem 0)
            , width (pct 100)
            , listStyle none
            , paddingRight gapWidthHalf
            , paddingLeft gapWidthHalf
            , alignItems stretch
            , display inlineFlex
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
            [ margin gapWidthHalf
            , position relative
            , width (pct 44)
            , displayFlex
            , flexDirection column
            , height (vh 95)
            , flexGrow (num 1)
            ]
        , id ItemImage
            [ position relative
            , backgroundSize cover
            , backgroundPosition center
            , height (pct 100)
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
            [ position relative
            , backgroundSize cover
            , backgroundPosition center
            , flexGrow (num 1)
            , height (rem 50)
            ]
        , id ProjectText
            [ position relative
            , color colorBlack
            , display block
            , margin auto
            , maxWidth (px 640)
            , fontSize (rem 2.5)
            , textDecoration none
            ]
        , id ProjectTitle
            [ position relative
            , color colorBlack
            , display block
            , margin auto
            , bottom headerHeightLarge
            , maxWidth (px 640)
            , fontSize (rem 2)
            , textDecoration none
            , lineHeight (rem 4)
            ]
        , id WorkContainer
            [ marginTop (rem 1.5)
            ]
        , id WorkTitle
            [ color colorBlack
            , textAlign left
            , fontSize (rem 2)
            , textDecoration none
            ]
        , id WorkIntro
            [ color colorGrey
            , marginTop (rem 1.5)
            , textAlign left
            , fontSize (rem 2)
            , textDecoration none
            ]
        , id WorkTag
            [ marginTop (rem 1.5)
            , color colorGreyLight
            , textAlign left
            , fontSize (rem 1.5)
            , textDecoration none
            ]
        , id ProjectDescription
            [ position relative
            , color colorBlack
            , maxWidth (px 640)
            , top (pct 50)
            , lineHeight gapWidthHalf
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
            [ color colorBlack
            , flex (num 1)
            , textAlign center
            , paddingRight iconWidth
            , textDecoration none
            , fontSize (rem 2)
            ]
        , id NavIcon
            [ position relative
            , textAlign left
            , color colorBlack
            , textDecoration none
            , displayFlex
            , fontSize (rem 2)
            , alignItems center
            ]
        , id Slogan
            [ position relative
            , textAlign center
            , color colorBlack
            , display block
            , bottom headerHeightLarge
            , textDecoration none
            , fontSize (rem 4.5)
            ]
        , id FooterText
            [ textAlign center
            , textDecoration none
            , fontSize (rem 2)
            ]
        , id FooterNext
            [ position relative
            , textAlign center
            , color colorBlack
            , display block
            , textDecoration none
            , fontSize (rem 5)
            ]
        , id SvgIcon
            [ width iconWidth
            , height (rem 1.3)
            ]
        ]


rem : Float -> Rem
rem =
    Css.rem


vw : Float -> Vw
vw =
    Css.vw


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


colorGrey : Color
colorGrey =
    hex "4E4F52"


colorGreyLight : Color
colorGreyLight =
    hex "909398"


colorTransparent : Color
colorTransparent =
    rgba 255 255 255 0.8


colorBlue : Color
colorBlue =
    hex "4286f4"


headerHeightLarge : Rem
headerHeightLarge =
    (rem 8)


gapWidth : Rem
gapWidth =
    (rem 3.5)


gapWidthHalf : Rem
gapWidthHalf =
    (rem 1.75)


iconWidth : Rem
iconWidth =
    (rem 3)


fullHeight : Vh
fullHeight =
    (vh 100)
