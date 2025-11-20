let
  # Read all files in the plugins directory
  files = builtins.readDir ./.;
  # Filter for .nix files, excluding default.nix
  nixFiles = builtins.filter
    (name: name != "default.nix" && builtins.match ".*\\.nix" name != null)
    (builtins.attrNames files);

  imports = map (name: ./. + "/${name}") nixFiles;
in
{
  imports = imports;
}
