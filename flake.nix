{
  description = "My flake templates";

  inputs = {
    official-templates.url = github:NixOS/templates;

    # https://github.com/srid/haskell-template
    haskell-slid.url = github:srid/haskell-template;
  };

  outputs = { self, official-templates, haskell-slid, ... }: {
    templates =
      with builtins;
      let
        # add prefix "_" to official template names
        prefixed-list = map (name: { name = "_${name}"; value = official-templates.templates."${name}"; }) (attrNames official-templates.templates);
        officials = listToAttrs prefixed-list;
      in
      {
        simple = {
          path = ./simple;
          description = "A simple template";
        };

        node = {
          path = ./node;
          description = "A nodejs template";
        };

        purescript = {
          path = ./purescript;
          description = "A purescript template";
        };

        haskell-mini = {
          path = ./haskell-mini;
          description = "A minimum haskell template";
        };

        # https://github.com/srid/haskell-template
        haskell-full = {
          path = haskell-slid.outPath;
          description = "A full haskell template (refer to github:srid/haskell-template)";
        };
      } // officials; # exntends official templates (their names are prefixed with "_")
  };
}
