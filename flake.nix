{
  description = "My flake templates";

  inputs = {
    official-templates.url = github:NixOS/templates;
  };

  outputs = { self, official-templates, ... }: {
    templates =
      with builtins;
      let
        # add prefix "_" to official templates
        prefixed-list = map (name: { name = "_${name}"; value = official-templates.templates."${name}"; }) (attrNames official-templates.templates);
        officials = listToAttrs prefixed-list;
      in
      {
        node = {
          path = ./node;
          description = "A nodejs project template";
        };

        purescript = {
          path = ./purescript;
          description = "A purescript project template";
        };
      } // officials;

  };
}
