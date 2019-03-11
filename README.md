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


- Start the project: `elm-live src/Main.elm --port=1234 --open -- --output=main.js --debug`

 