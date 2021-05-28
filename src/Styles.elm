module Styles exposing (..)
import Html
import Html.Attributes

-- *****************************************************************************
-- Styles
-- *****************************************************************************
defaultFontFamily : Html.Attribute msg
defaultFontFamily = Html.Attributes.style "font-family" "Ubuntu, Helvetica"

defaultMargin : Html.Attribute msg
defaultMargin = Html.Attributes.style "margin" "1rem"

styleList : List (Html.Attribute msg)
styleList = [
    Html.Attributes.style "padding" "0.5rem"
    ]

styleRow : List (Html.Attribute msg)
styleRow = [
    Html.Attributes.style "background-color" "#e1e5ea"
    , Html.Attributes.style "width" "50rem"
    , Html.Attributes.style "cursor" "pointer"
    , Html.Attributes.style "padding" "0.3rem"
    , Html.Attributes.style "margin" "0.2rem"
    ]    

paddingRow : Html.Attribute msg
paddingRow = Html.Attributes.style "padding" "1rem;"

defaultHeight : Html.Attribute msg
defaultHeight = Html.Attributes.style "height" "1.5rem"

defaultInput : List (Html.Attribute msg)
defaultInput = [
  defaultFontFamily
  , Html.Attributes.style "font-size" "1rem"
  , defaultHeight
  ]

primaryButton : List (Html.Attribute msg)
primaryButton = [
  defaultFontFamily
  , Html.Attributes.style "font-size" "0.9rem"
  , Html.Attributes.style "border" "0px"
  , Html.Attributes.style "border-radius" "0.8rem"
  , Html.Attributes.style "background-color" "#a7bbc7"
  , Html.Attributes.style "padding" "0.7rem"
  , Html.Attributes.style "margin-left" "0.5rem"
  ]
 