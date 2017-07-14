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
    | ProjectDescriptionTitle
    | NextProjectImage
    | PreviousProjectImage
    | TextCenter
    | Image
    | Overlay
    | NavTitle


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
            , height headerHeightMedium
            , overflow hidden
            , zIndex 2
              -- , boxShadow5 (rem 0) (rem 0.5) (rem 0.5) (rem 0.01) colorLightGrey
            ]
        , id BodySection
            [ paddingTop headerHeightMedium
            , backgroundColor colorWhite
            , paddingBottom footerHeight
              -- , maxWidth (rem 100)
            , margin auto
            , zIndex 1
            ]
        , id FooterSection
            [ position absolute
            , bottom (rem 0)
            , width (pct 100)
            , height footerHeight
            , backgroundColor colorNav
            , zIndex 0
            ]
        , id NavContainer
            [ paddingLeft (rem 0.5)
            , paddingRight (rem 0.5)
            , height (pct 100)
            , textAlign center
            , backgroundColor colorWhite
            , borderBottom3 (px 1) solid colorGrey
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
            [ margin (rem 0.75)
            , position relative
            , backgroundSize cover
            , backgroundPosition center
            , flexGrow (num 1)
            , height (rem 12.5)
            , minWidth (rem 30)
            , border3 (px 1) solid colorGrey
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
            [ margin (rem 0.5)
            , position relative
            , backgroundSize cover
            , backgroundPosition center
            , flexGrow (num 1)
            , height (rem 12.5)
            , minWidth (rem 20)
            , border3 (px 1) solid colorGrey
            ]
        , id PreviousProjectImage
            [ backgroundSize cover
            , backgroundPosition center
            , flexGrow (num 1)
            , marginTop (rem 2)
            , height (rem 9)
            , right (rem 1.5)
            , minWidth (rem 5)
            , border3 (px 1) solid colorGrey
            ]
        , id NextProjectImage
            [ backgroundSize cover
            , backgroundPosition center
            , flexGrow (num 1)
            , marginTop (rem 2)
            , height (rem 9)
            , left (rem 1.5)
            , minWidth (rem 5)
            , border3 (px 1) solid colorGrey
            ]
        , id ProjectText
            [ margin (rem 0.5)
            , flexGrow (num 1)
            , height (rem 25)
            , width (rem 20)
            ]
        , id ProjectTitle
            [ margin (rem 0.5)
            , paddingTop (rem 2.5)
            , paddingBottom (rem 2.5)
            , fontSize (rem 1.5)
            , color colorBlack
            , textAlign center
            ]
        , id ProjectDescriptionTitle
            [ margin (rem 0.5)
            , textAlign left
            , fontSize (rem 0.75)
            , paddingBottom (rem 1)
            , borderBottom3 (px 1) solid colorGrey
            ]
        , id ProjectDescription
            [ margin (rem 0.5)
            , textAlign left
            , fontSize (rem 0.5)
            , paddingBottom (rem 1)
            , borderBottom3 (px 1) solid colorGrey
            ]
        , id TextCenter
            [ position relative
            , textAlign center
            , color colorBlack
            , top (pct 50)
            , textDecoration none
            , fontSize (rem 1)
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
            , textAlign center
            , color colorBlack
            , top (pct 25)
            , textDecoration none
            , paddingTop (rem 1)
            , paddingBottom (rem 1)
            , fontSize (rem 1)
            ]
        , mediaQuery "screen and ( min-width: 741px )"
            [ id NavTitle
                [ fontSize (rem 2)
                ]
            , id HeaderSection
                [ height headerHeightLarge ]
            , id BodySection
                [ paddingTop headerHeightLarge ]
            , id FlexItem
                [ margin (rem 1.5)
                , height (rem 25)
                ]
            , id TextCenter
                [ fontSize (rem 2) ]
            , id ProjectImage
                [ height (rem 25) ]
            , id PreviousProjectImage
                [ height (rem 18)
                , minWidth (rem 10)
                , marginTop (rem 4)
                , right (rem 3)
                ]
            , id NextProjectImage
                [ height (rem 18)
                , minWidth (rem 10)
                , marginTop (rem 4)
                , left (rem 3)
                ]
            , id ProjectTitle
                [ fontSize (rem 3)
                , paddingTop (rem 5)
                , paddingBottom (rem 5)
                ]
            , id ProjectDescription
                [ fontSize (rem 1) ]
            , id ProjectDescriptionTitle
                [ fontSize (rem 1.5) ]
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
    rgba 49 49 49 0.25


colorBlue : Color
colorBlue =
    hex "4286f4"


headerHeightLarge : Rem
headerHeightLarge =
    (rem 6)


headerHeightMedium : Rem
headerHeightMedium =
    (rem 3)


footerHeight : Rem
footerHeight =
    (rem 15)
