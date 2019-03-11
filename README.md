# Elm hands-on

This projects aims to introduce Elm basics as a hands-on project

## Startup

Install [Git](https://git-scm.com/downloads) if it is not already done

### Install `elm`

#### MacOS

Prerequisites: [Homebrew](https://brew.sh/index_fr)

- Install elm: `brew install elm`
- Install or update npm: `brew install npm` or `brew upgrade npm`
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`

#### Unix 
- Install elm: `apt-get install elm`
- Install or update npm: `apt-get install npm` or `apt-get upgrade npm`
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`

#### Windows
- Install elm: [Windows Installer](https://guide.elm-lang.org/install.html)
- Install or update npm: [Node](https://nodejs.org/en/download/)
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`

### Unit tests
Install [elm-test](https://github.com/elm-community/elm-test): `npm install -g elm-test`

### Formatter
Install [elm-format](https://github.com/avh4/elm-format) following this startup guide: [Install Elm format](https://github.com/avh4/elm-format)

This aims to format using Elm style guide when saving.

## Check configuration

```
➜  ~ elm --version     
0.19.0
➜  ~ elm-live --version
3.2.3
➜  ~ elm-test --version
0.19.0-rev6
➜  ~ elm-format --help 
elm-format 0.8.1

Usage: elm-format [INPUT] [--output FILE] [--yes] [--validate] [--stdin]
                  [--elm-version VERSION] [--upgrade]
  Format Elm source files.

Available options:
  -h,--help                Show this help text
  --output FILE            Write output to FILE instead of overwriting the given
                           source file.
  --yes                    Reply 'yes' to all automated prompts.
  --validate               Check if files are formatted without changing them.
  --stdin                  Read from stdin, output to stdout.
  --elm-version VERSION    The Elm version of the source files being formatted.
                           Valid values: 0.18, 0.19. Default: auto
  --upgrade                Upgrade older Elm files to Elm 0.19 syntax

Examples:
  elm-format Main.elm                     # formats Main.elm
  elm-format Main.elm --output Main2.elm  # formats Main.elm as Main2.elm
  elm-format src/                         # format all *.elm files in the src directory

Full guide to using elm-format at <https://github.com/avh4/elm-format>
➜  ~ 
```

## Step-0: Hello World

- Checkout the project and switch to branch `step-0`: 
```git
git checkout step-0
```

- Try compiling the code:
```
elm make src/Main.elm
```
When running this command, elm transpiles elm code to javascript inside `index.html` file.

- Open `index.html` in a browser and you should see your first Elm application 

- Rewrite `index.html` file with following content:

```html
<!DOCTYPE HTML>
<html>
<head>
  <meta charset='UTF-8'>
  <title>Main</title>
</head>

<body>
<div id='elm-f0111bc4e658d0f98db96260c16f7e49'></div>
<script src='main.js'></script>
<script>
  Elm.Main.init({ node: document.getElementById('elm-f0111bc4e658d0f98db96260c16f7e49') });
</script>
</body>
</html>
```

- Run the following command: `elm make src/Main.elm --output=main.js`

- Reload `index.html` in your browser. You should see the same output as before but now, the elm compiler will generate `main.js`.

## Step-1: elm-live 

[elm-live](https://github.com/wking-io/elm-live) is a flexible dev server for Elm which includes hot-reload. 

- Install [`elm-live`](#hot-reload) if not already done 

- Run the following command: `elm-live src/Main.elm --port=1234 --open  -- --output=main.js`

You should see as following: 
![Elm-live](doc/elm-live.png)

- Update `Main.elm` to change the output message and save.

See your browser and notice it should have reloaded the page automatically.

## Step-2: Elm ecosystem

### REPL: `elm repl`

This REPL (*Read Eval Print Loop*) allows you to run any elm statement in the terminal (eg. to check syntax or semantics).

- Run elm repl: `elm repl`

- Develop and evaluate following expressions:
   - Adding `40` and `2` (let's start easy)
   ```elm
   40 + 2
   ```
   
   - Create a function which adds two numbers (*integer*) and call it 
   ```elm
   > add i j = i + j
   <function> : number -> number -> number
   > add 40 2
   42 : number
   ```
   - Create a function which takes a login in parameter and returns "Hello " + login
   ```elm
   > hello login = "Hello " ++ login
   <function> : String -> String
   > hello "Rémi"
   "Hello Rémi" : String
   ```
   - Create a function which takes a `Maybe String` and returns "Hello " + login if login is defined and "Hello World" otherwise.
   ```elm
   > hello maybeLogin = case maybeLogin of \
   |   Nothing -> "Hello World"\
   |   Just login -> "Hello " ++ login
   <function> : Maybe String -> String
   > hello (Just "Rémi")
   "Hello Rémi" : String
   > hello Nothing
   "Hello World" : String
   ```

Bonus for currying:
```elm
> multiply a b = a * b 
<function> : number -> number -> number
> multiplyByThree a = multiply a 3
<function> : number -> number
> multiplyByThree 10
30 : number
```

### Package manager: `elm-package`

As for node, `elm` has a package manager which let us publish or download packages from [Elm packages](https://package.elm-lang.org/).

A package is one or several modules and you can see them as a collection of utilities function (that are exposed).

Package are prefixed with the module author nickname (or elm for core modules) and then the package name separated with a `/` (eg. `mdgriffith/elm-ui`). 

- Install `elm/svg` package

- Notice the dependency package in the `elm-stuff/packages` directory

- Use your application to draw a circle (use documentation) or any forms you want

### Online editor: [Ellie](https://ellie-app.com/new)

Use this online editor if you want to try some code without having a local project.

## Step-3: Elm syntax

### Boolean

`True` or `False`. Nothing else to explain.

### Arithmetic operators 

Kind of easy so let's skip this one (`+`, `-`, `*` and `/`)...

Small tips: `//` is also a division operator but it returns the Int value of it.

Note that these operators are functions so they can also be used in *prefix style* like `(+) 40 2`

Using it like `40 + 2` is called the **infix style**.

### Comparison

Nothing specific here except the `not equal` operator which look more like a different: `/=`
```
(==) = eq
(/=) = neq
(<)  = lt
(>)  = gt
(<=) = le
(>=) = ge
```

### Associativity 

Running `40 + 2 * 100` will return `240` (operator precedence).

If we want to execute `40 + 2` before multiplying it with `100` we need to explicitely tell so:
`(40 + 2) * 100`

### Basic types

![Basic types](doc/basic_types.png)

### Conditions 

#### If statements
```elm
message : Int -> String
message age =
    if age > 30 then
        "You are older than me"

    else
        "You are younger than me"
```

#### Case statements (pattern matching)
```elm
message : Int -> String
message age =
    case age > 30 of
        True -> "You are older than me"
        False -> "You are younger than me"
```

### Functions

- **Fact 1**: A function always returns something!
- **Fact 2**: Explicitely write function signature helps!
- **Fact 3**: Function are testable (easily)

```elm
increment : Int -> Int -> Int 
increment a b = a + b
```

You can apply a function partially (currying):
```elm
multiplyByTwo : Int -> Int
multiplyByTwo a = increment a a
```

### Infix operator (my favourite)

When calling a function like: 
```elm
add : Int -> Int -> Int 
add a b = a + b
```

You have two possibilities: 
```elm
add 40 2 
2 |> add 40
```

`|>` means *appendLeft* and helps for code readability most of the time.

### Let

`let` statement helps you extracting temporary variables before returning the function results.

For example:

```elm
addAndMultiplyBy Int -> Int -> Int -> Int
addAndMultiplyBy a b c = 
    let 
        addResult : Int 
        addResult = a + b
    in 
    addResult * c
```

This can also help in code-readability as to extract result operations in named variables.

## Step-4: The Elm Architecture

Elm program can be divided into three cleanly separated parts:

![Elm architecture](doc/elm-architecture.png)

- *Model* — the state of your application
- *update* — a way to update your state
- *view* — a way to view your state as HTML

Writing a new Elm module often starts with the following skeleton:

```elm
module Module exposing (..)
import ...

-- MODEL

type alias Model = { ... }


-- UPDATE

type Msg = Write | ...

update : Msg -> Model -> Model
update msg model =
  case msg of
    Write -> model
    _ -> ...


-- VIEW

view : Model -> Html Msg
view model =
  ...
```

### Elm debugger - A time machine

You can enable Elm debugger easily by adding `--debug` option to your `elm-live` start-up:
`elm-live src/Counter.elm --port=1234 --open  -- --output=main.js --debug`

This gives you access to the bottom right panel:
![elm-debugger-1](doc/elm-debugger-1.png) 

Clicking on it will give you access to the history of any action done in your application so you can replay them one by one:
![elm-debugger-1](doc/elm-debugger-2.png) 

This can be very useful whenever you want to debug your application behaviour.

### Exercise 1: Counter

- Create a new Elm file `Counter.elm` in your `src` directory as below:

```elm
module Counter exposing (Model, Msg(..), initialModel, main, update, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 0 }


type Msg
    = Increment


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+1" ]
        , div [] [ text <| String.fromInt model.count ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

```

- Run the program: `elm-live src/Counter.elm --port=1234 --open  -- --output=main.js`

- Implement `decrement` action

### Exercise 2: Text input

- Create a new Elm module: `Input.elm`
- This module should expose an input text and when typing, the state should be updated and a message `Hello ` + login should appear
![hello-step-4](doc/step-4.elm)
- **Bonus**: Write "Hello World" whenever the typed value from input is empty