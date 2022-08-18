{
  description = "My flake templates";

  inputs = {
    official-templates.url = github:NixOS/templates;
  };

  outputs = { self, official-templates, ... }: {
    templates = {
      node = {
        path = ./node;
        description = "A nodejs project template";
      };
      purescript = {
        path = ./purescript;
        description = "A purescript project template";
      };
    } // official-templates.templates; # extend official templates
  };
}
