{
  description = '' A dynamic preferences-system with a table-like structure for Nim.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."niprefs-main".dir   = "main";
  inputs."niprefs-main".owner = "nim-nix-pkgs";
  inputs."niprefs-main".ref   = "master";
  inputs."niprefs-main".repo  = "niprefs";
  inputs."niprefs-main".type  = "github";
  inputs."niprefs-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."niprefs-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}