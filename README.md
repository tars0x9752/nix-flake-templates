# Templates

Nix Flake Templates

## List

`nix flake show 'github:tars0x9752/templates'`

## Usage

```sh
nix flake init -t 'github:tars0x9752/templates#<TEMPLATE-NAME-HERE>'

# or

nix flake new <dirName> -t 'github:tars0x9752/templates#<TEMPLATE-NAME-HERE>'
```
### Examples

```sh
# example 1
nix flake init -t 'github:tars0x9752/templates#trivial'

# example 2
nix flake new node-project -t 'github:tars0x9752/templates#node'
```