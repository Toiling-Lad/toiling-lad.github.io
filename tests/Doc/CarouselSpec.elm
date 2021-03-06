module Doc.CarouselSpec exposing (spec)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect
import Carousel exposing(..)


spec : Test.Test
spec =
    Test.describe "Carousel" <|
    [
        Test.describe "#onwards" <|
            [
            Test.test "Example: 1 -- `onwards { previous = 1, current = 2, ...`" <|
                \() ->
                    Expect.equal
                        (
                            onwards { previous = 1, current = 2, next = 3, rest = []}
                        )
                        (
                            { previous = 2, current = 3, next = 1, rest = []}
                        )
            , Test.test "Example: 2 -- `onwards { previous = 1, current = 2, ...`" <|
                \() ->
                    Expect.equal
                        (
                            onwards { previous = 1, current = 2, next = 3, rest = [4, 5, 6]}
                        )
                        (
                            { previous = 2, current = 3, next = 4, rest = [5, 6, 1]}
                        )
            ]
        , Test.describe "#backwards" <|
            [
            Test.test "Example: 1 -- `backwards { previous = 1, current = 2...`" <|
                \() ->
                    Expect.equal
                        (
                            backwards { previous = 1, current = 2, next = 3, rest = []}
                        )
                        (
                            { previous = 3, current = 1, next = 2, rest = []}
                        )
            , Test.test "Example: 2 -- `backwards { previous = 1, current = 2...`" <|
                \() ->
                    Expect.equal
                        (
                            backwards { previous = 1, current = 2, next = 3, rest = [4, 5, 6]}
                        )
                        (
                            { previous = 6, current = 1, next = 2, rest = [3, 4, 5]}
                        )
            ]
        , Test.describe "#fromList" <|
            [
            Test.test "Example: 1 -- `fromList \"Meera\" [] --> Err \"not found\"`" <|
                \() ->
                    Expect.equal
                        (
                            fromList "Meera" []
                        )
                        (
                            Err "not found"
                        )
            , Test.test "Example: 2 -- `fromList \"Cersei\" [ \"Cersei\", \"Hodor\"...`" <|
                \() ->
                    Expect.equal
                        (
                            fromList "Cersei" [ "Cersei", "Hodor"]
                        )
                        (
                            Err "list was too short"
                        )
            , Test.test "Example: 3 -- `fromList \"Meera\" [ \"Cersei\", \"Hodor\",...`" <|
                \() ->
                    Expect.equal
                        (
                            fromList "Meera" [ "Cersei", "Hodor", "Joffrey", "Meera" ]
                        )
                        (
                            Ok { previous = "Joffrey", current = "Meera", next = "Cersei", rest = ["Hodor"] }
                        )
            ]
    ]