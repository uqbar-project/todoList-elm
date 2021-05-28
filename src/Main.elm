module Main exposing (main)

-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--
-- Paleta de colores: https://colorhunt.co/palette/282026
--

import Browser
import Html exposing (Html, br, button, div, h1, input, span, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onClick, onInput)
import List.Extra exposing (remove)
import Styles exposing (defaultFontFamily, defaultInput, defaultMargin, primaryButton, styleList, styleRow)

-- MAIN

main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { tareas : List String
    , nuevaTarea : String
    }


init : Model
init =
    { tareas =
        [ "Dar Elm"
        , "Rendir Funcional"
        , "Comer asado"
        ]
    , nuevaTarea = ""
    }



-- UPDATE


type Msg
    = AgregarTarea String
    | EliminarTarea String
    | ActualizarTarea String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AgregarTarea tarea ->
            { tareas = model.tareas ++ [ tarea ], nuevaTarea = "" }

        EliminarTarea tarea ->
            { tareas = remove tarea model.tareas, nuevaTarea = "" }

        ActualizarTarea tarea ->
            { tareas = model.tareas, nuevaTarea = tarea }



-- VIEW


view : Model -> Html Msg
view model =
    div [ defaultFontFamily, defaultMargin ] -- estilo
        [ h1 [] [ text "Lista de cosas para hacer" ]
        , div styleList -- estilo
            (List.map
                taskView
                model.tareas
            )
        , br [] []
        , input (defaultInput ++ [ placeholder "Descripción de la tarea", value model.nuevaTarea, onInput ActualizarTarea ]) [ ]
        , button (primaryButton ++ [ onClick (AgregarTarea model.nuevaTarea) ]) [ text "Agregar tarea" ]
        ]


taskView : String -> Html Msg
taskView task =
    div (styleRow ++ [ onClick (EliminarTarea task) ])
        [ span styleRow [ text task ] ]

