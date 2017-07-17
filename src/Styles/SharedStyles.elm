module Styles.SharedStyles exposing (..)

import Html.CssHelpers exposing (withNamespace)


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
    | TextCenter
    | Image
    | Overlay
    | NavTitle
    | PreviousProjectImage
    | NextProjectImage
    | Slogan
    | FooterText
    | FooterNext


styleNamespace : Html.CssHelpers.Namespace String class id msg
styleNamespace =
    withNamespace "style"