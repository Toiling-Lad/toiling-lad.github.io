module Carousel exposing (..)


type alias Carousel a =
    { previous : a
    , current : a
    , next : a
    , rest : List a
    }


{-|
    onwards { previous = 1, current = 2, next = 3, rest = []}
    --> { previous = 2, current = 3, next = 1, rest = []}

    onwards { previous = 1, current = 2, next = 3, rest = [4, 5, 6]}
    --> { previous = 2, current = 3, next = 4, rest = [5, 6, 1]}

-}
onwards : Carousel a -> Carousel a
onwards { previous, current, next, rest } =
    let
        newNext =
            rest |> List.head |> Maybe.withDefault previous

        newRest =
            case rest of
                [] ->
                    []

                head :: tail ->
                    tail ++ [ previous ]
    in
        { previous = current
        , current = next
        , next = newNext
        , rest = newRest
        }


{-|
    backwards { previous = 1, current = 2, next = 3, rest = []}
    --> { previous = 3, current = 1, next = 2, rest = []}

    backwards { previous = 1, current = 2, next = 3, rest = [4, 5, 6]}
    --> { previous = 6, current = 1, next = 2, rest = [3, 4, 5]}

-}
backwards : Carousel a -> Carousel a
backwards { previous, current, next, rest } =
    let
        newPrevious =
            rest |> List.reverse |> List.head |> Maybe.withDefault next

        newRest =
            case List.reverse rest of
                [] ->
                    []

                head :: tail ->
                    next :: List.reverse tail
    in
        { previous = newPrevious
        , current = previous
        , next = current
        , rest = newRest
        }


{-|
    fromList "Meera" []
    --> Err "not found"

    fromList "Cersei" [ "Cersei", "Hodor"]
    --> Err "list was too short"

    fromList "Meera" [ "Cersei", "Hodor", "Joffrey", "Meera" ]
    --> Ok { previous = "Joffrey", current = "Meera", next = "Cersei", rest = ["Hodor"] }

-}
fromList : a -> List a -> Result String (Carousel a)
fromList needle list =
    let
        length =
            List.length list

        recurse remainingRounds needle list =
            if remainingRounds <= 0 then
                Err "not found"
            else
                case list of
                    [] ->
                        Err "list was too short"

                    _ :: [] ->
                        Err "list was too short"

                    _ :: _ :: [] ->
                        Err "list was too short"

                    prev :: curr :: next :: rest ->
                        if curr == needle then
                            Ok { previous = prev, current = curr, next = next, rest = rest }
                        else
                            recurse (remainingRounds - 1) needle (curr :: next :: rest ++ [ prev ])
    in
        recurse length needle list
