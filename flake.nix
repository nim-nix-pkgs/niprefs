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
  
  inputs."niprefs-0_1_2".dir   = "0_1_2";
  inputs."niprefs-0_1_2".owner = "nim-nix-pkgs";
  inputs."niprefs-0_1_2".ref   = "master";
  inputs."niprefs-0_1_2".repo  = "niprefs";
  inputs."niprefs-0_1_2".type  = "github";
  inputs."niprefs-0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."niprefs-0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."niprefs-0_1_3".dir   = "0_1_3";
  inputs."niprefs-0_1_3".owner = "nim-nix-pkgs";
  inputs."niprefs-0_1_3".ref   = "master";
  inputs."niprefs-0_1_3".repo  = "niprefs";
  inputs."niprefs-0_1_3".type  = "github";
  inputs."niprefs-0_1_3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."niprefs-0_1_3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."niprefs-0_1_4".dir   = "0_1_4";
  inputs."niprefs-0_1_4".owner = "nim-nix-pkgs";
  inputs."niprefs-0_1_4".ref   = "master";
  inputs."niprefs-0_1_4".repo  = "niprefs";
  inputs."niprefs-0_1_4".type  = "github";
  inputs."niprefs-0_1_4".inputs.nixpkgs.follows = "nixpkgs";
  inputs."niprefs-0_1_4".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."niprefs-0_1_5".dir   = "0_1_5";
  inputs."niprefs-0_1_5".owner = "nim-nix-pkgs";
  inputs."niprefs-0_1_5".ref   = "master";
  inputs."niprefs-0_1_5".repo  = "niprefs";
  inputs."niprefs-0_1_5".type  = "github";
  inputs."niprefs-0_1_5".inputs.nixpkgs.follows = "nixpkgs";
  inputs."niprefs-0_1_5".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."niprefs-0_1_61".dir   = "0_1_61";
  inputs."niprefs-0_1_61".owner = "nim-nix-pkgs";
  inputs."niprefs-0_1_61".ref   = "master";
  inputs."niprefs-0_1_61".repo  = "niprefs";
  inputs."niprefs-0_1_61".type  = "github";
  inputs."niprefs-0_1_61".inputs.nixpkgs.follows = "nixpkgs";
  inputs."niprefs-0_1_61".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
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