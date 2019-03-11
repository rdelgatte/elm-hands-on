module Counter exposing (Model, Msg(..), initialModel, main, update, view)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { login : String }


initialModel : Model
initialModel =
    { login = "" }


type Msg
    = OnChange String


update : Msg -> Model -> Model
update msg model =
    case msg of
        OnChange updatedLogin ->
            { login = updatedLogin }


view : Model -> Html Msg
view model =
    let
        helloMessage : String
        helloMessage =
            case model.login |> String.isEmpty of
                True ->
                    "Hello World!"

                False ->
                    model.login |> String.append "Hello "
    in
    div []
        [ input [ onInput OnChange ] [ text model.login ]
        , div [] [ text helloMessage ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
