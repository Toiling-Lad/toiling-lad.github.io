module Test.Generated.Main3894620637 exposing (main)

import Doc.CarouselSpec
import Doc.Routing.HelpersSpec

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test
import Json.Encode

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Doc.CarouselSpec" [Doc.CarouselSpec.spec],     Test.describe "Doc.Routing.HelpersSpec" [Doc.Routing.HelpersSpec.spec] ]
        |> Test.concat
        |> Test.Runner.Node.runWithOptions { runs = Nothing, report = (ConsoleReport UseColor), seed = Nothing, processes = 4, paths = []}