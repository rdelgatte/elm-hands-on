# Elm hands-on

This projects aims to introduce Elm basics as a hands-on project

## Startup

### MacOS

Prerequisites: [Homebrew](https://brew.sh/index_fr)

- Install elm: `brew install elm`
- Install or update npm: `brew install npm` or `brew upgrade npm`
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`
- Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js`

### Unix 
- Install elm: `apt-get install elm`
- Install or update npm: `apt-get install npm` or `apt-get upgrade npm`
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`
- Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js`

### Windows
- Install elm: [Windows Installer](https://guide.elm-lang.org/install.html)
- Install or update npm: [Node](https://nodejs.org/en/download/)
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`
- Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js`

## Technologies 
Written in [Elm 0.19.0](https://elm-lang.org/)

![Elm logo](doc/logo.png)

### Code style guide
I recommend using [NoRedInk Elm style guide](https://github.com/NoRedInk/elm-style-guide) which defines some basic rules for naming and styling our code.

### Hot-reload
Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`

Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js --debug`

### Unit tests
Install [elm-test](https://github.com/elm-community/elm-test): `npm install -g elm-test`

Run unit tests: `elm-test --watch`

### Formatter
Install [elm-format](https://github.com/avh4/elm-format) following this startup guide: [Install Elm format](https://github.com/avh4/elm-format)

This aims to format using Elm style guide when saving.


## Check configuration

Elm version should be **0.19.0**
```
➜  ~ elm --version
0.19.0
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

- Run the following command: `elm-live src/Main.elm --port=1234 --open  -- --output=main.js --debug`

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