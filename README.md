# Templates

A flake of template flakes. (WIP)

## Show templates list

```sh
nix flake show 'github:tars0x9752/templates'
```

**Note:** We extends official NixOS's templates and their names are prefixed with `_`.

## Usage

```sh
nix flake init -t 'github:tars0x9752/templates#<TEMPLATE-NAME-HERE>'

# or

nix flake new <dirName> -t 'github:tars0x9752/templates#<TEMPLATE-NAME-HERE>'
```
## Templates

### simple

A simple template.

```sh
nix flake new project-name -t 'github:tars0x9752/templates#simple'
```

### node

A NodeJS template with TypeScript.

```sh
nix flake new project-name -t 'github:tars0x9752/templates#node'
```

### purescript

A PureScript template.

```sh
nix flake new project-name -t 'github:tars0x9752/templates#purescript'
```

### haskell-mini

A mini haskell template.

```sh
nix flake new project-name -t 'github:tars0x9752/templates#haskell-mini'
```

### haskell-srid (srid/haskell-template)

A full haskell template. (Just a ref to [`github:srid/haskell-template`](https://github.com/srid/haskell-template))

```sh
nix flake new project-name -t 'github:tars0x9752/templates#haskell-srid'
```

### NixOS official templates

> **Note:** Official NixOS's template names are prefixed with `_` here.

```sh
# Usage
nix flake new project-name -t 'github:tars0x9752/templates#_OFFICIAL-TEMPLATE-NAME-HERE'

# For "go-hello" template
nix flake new project-name -t 'github:tars0x9752/templates#_go-hello'
```
