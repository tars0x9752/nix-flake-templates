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
## My templates


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

### NixOS official templates


```sh
# Usage
nix flake new project-name -t 'github:tars0x9752/templates#_OFFICIAL-TEMPLATE-NAME-HERE'

# For "haskell-hello"
nix flake new project-name -t 'github:tars0x9752/templates#_haskell-hello'
```
