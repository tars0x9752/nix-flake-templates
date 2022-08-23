{
  description = "My flake templates";

  inputs = {
    official-templates.url = github:NixOS/templates;
  };

  outputs = { self, official-templates, ... }: {
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
          description = "A simple project template";
        };

        node = {
          path = ./node;
          description = "A nodejs project template";
        };

        purescript = {
          path = ./purescript;
          description = "A purescript project template";
        };
      } // officials; # exntends official templates (their names are prefixed with "_")

  };
}
