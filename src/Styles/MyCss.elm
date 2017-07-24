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
            [ height (vh 100)
            , margin (rem 3.5)
            ]
        , id ContactSection
            [ backgroundColor colorWhite
            , height (pct 100)
            ]
        , id NavContainer
            [ padding (rem 3.5)
            , height (pct 100)
            , backgroundColor transparent
            ]
        , id FlexContainer
            [ margin (rem 0)
            , width (pct 100)
            , listStyle none
            , paddingRight (rem 1.75)
            , paddingLeft (rem 1.75)
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
            [ margin (rem 1.75)
            , position relative
            , width (pct 44)
            , height (vh 100)
              -- , backgroundSize cover
              -- , backgroundPosition center
            , flexGrow (num 1)
              -- , width (rem 30)
            ]
        , id ItemImage
            [ position relative
            , backgroundSize cover
            , backgroundPosition center
            , height (pct 70)
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
            [ margin (rem 1.5)
            , flexGrow (num 1)
            , width (rem 20)
            ]
        , id ProjectTitle
            [ position relative
            , color colorBlack
            , display block
            , margin auto
            , maxWidth (px 640)
            , top (vh 25)
            , fontSize (rem 2.5)
            , textDecoration none
            ]
        , id WorkContainer
            [ marginBottom (rem 1.5)
            , marginTop (rem 1.5)
            ]
        , id WorkTitle
            [ color colorBlack
            , textAlign left
            , fontSize (rem 1)
            , textDecoration none
            ]
        , id WorkIntro
            [ color colorGrey
            , marginTop (rem 1.5)
            , textAlign left
            , fontSize (rem 1)
            , textDecoration none
            ]
        , id WorkTag
            [ marginTop (rem 1.5)
            , color colorGreyLight
            , marginBottom (rem 1.5)
            , textAlign left
            , fontSize (rem 0.9)
            , textDecoration none
            ]
        , id ProjectDescription
            [ position relative
            , color colorBlack
              -- , display block
              -- , margin auto
            , maxWidth (px 640)
            , top (pct 50)
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
            , textDecoration none
            , fontSize (rem 2)
            ]
        , id Slogan
            [ position relative
            , textAlign center
            , color colorBlack
            , display block
            , top (pct 40)
            , textDecoration none
            , fontSize (rem 4.5)
            ]
        , id FooterText
            [ position relative
            , textAlign center
            , color colorBlack
            , display block
            , top (pct 40)
            , textDecoration none
            , fontSize (rem 4.5)
            ]
        , id FooterNext
            [ position relative
            , textAlign center
            , color colorWhite
            , display block
              -- , top (pct 40)
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


footerHeight : Vh
footerHeight =
    (vh 100)
