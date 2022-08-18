# nix-flake-templates

## list

`nix flake show 'github:tars0x9752/nix-flake-templates'`

## usage

```sh
nix flake init -t 'github:tars0x9752/nix-flake-templates#<TEMPLATE-NAME-HERE>'

# or

nix flake new dirName -t 'github:tars0x9752/nix-flake-templates#<TEMPLATE-NAME-HERE>'

# example 1
nix flake init -t 'github:tars0x9752/nix-flake-templates#trivial'

# example 2
nix flake new hello -t 'github:tars0x9752/nix-flake-templates#trivial'
```