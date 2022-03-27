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
  
  inputs."niprefs-0_1_1".dir   = "0_1_1";
  inputs."niprefs-0_1_1".owner = "nim-nix-pkgs";
  inputs."niprefs-0_1_1".ref   = "master";
  inputs."niprefs-0_1_1".repo  = "niprefs";
  inputs."niprefs-0_1_1".type  = "github";
  inputs."niprefs-0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."niprefs-0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
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