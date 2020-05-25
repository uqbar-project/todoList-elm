module Main exposing (main)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (Html, br, button, div, h1, input, span, text)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onClick, onInput)
import List.Extra exposing (remove)



-- MAIN


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
            { tareas = List.Extra.remove tarea model.tareas, nuevaTarea = "" }

        ActualizarTarea tarea ->
            { tareas = model.tareas, nuevaTarea = tarea }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Lista de cosas para hacer" ]
        , div []
            (List.map
                taskView
                model.tareas
            )
        , br [] []
        , input [ placeholder "Descripción de la tarea", value model.nuevaTarea, onInput ActualizarTarea ] []
        , button [ onClick (AgregarTarea model.nuevaTarea) ] [ text "Agregar tarea" ]
        ]


taskView : String -> Html Msg
taskView task =
    div [ class "task-label", onClick (EliminarTarea task) ]
        [ span [] [ text task ] ]
