module Main exposing (main)

import Svg exposing (..)
import Svg.Attributes exposing (..)


main =
    svg
        [ width "200"
        , height "120"
        , viewBox "0 0 120 120"
        ]
        [ circle
            [ cx "160"
            , cy "50"
            , r "50"
            ]
            []
        ]
