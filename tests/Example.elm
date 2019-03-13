module Example exposing (reverseStringTestSuite)

import Expect exposing (Expectation)
import Fuzz
import Test exposing (Test)


reverseStringTestSuite : Test
reverseStringTestSuite =
    Test.describe "Testing String reverse" <|
        [ Test.test "Given kayak, reversing the string should return kayak" <|
            \_ ->
                "kayak"
                    |> String.reverse
                    |> Expect.equal "kayak"
        , Test.test "Given elm, reversing the string should return mle" <|
            \_ ->
                "elm"
                    |> String.reverse
                    |> Expect.equal "mle"
        , Test.fuzz Fuzz.string "[Fuzz] Generating a random word, reversing twice should return the same word" <|
            \randomString ->
                randomString
                    |> String.reverse
                    |> String.reverse
                    |> Expect.equal randomString
        ]
