{
  description = ''KDialog Qt5 Wrapper, easy API, KISS design'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."kdialog-master".dir   = "master";
  inputs."kdialog-master".owner = "nim-nix-pkgs";
  inputs."kdialog-master".ref   = "master";
  inputs."kdialog-master".repo  = "kdialog";
  inputs."kdialog-master".type  = "github";
  inputs."kdialog-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."kdialog-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
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