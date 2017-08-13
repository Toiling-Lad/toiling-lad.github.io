module Styles.SharedStyles exposing (..)

import Html.CssHelpers exposing (withNamespace)


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
    | ProjectDescription
    | WorkContainer
    | WorkTitle
    | WorkIntro
    | WorkTag
    | TextCenter
    | Image
    | Overlay
    | NavTitle
    | Slogan
    | FooterText
    | FooterNext
    | SvgIcon


styleNamespace : Html.CssHelpers.Namespace String class id msg
styleNamespace =
    withNamespace "style"
