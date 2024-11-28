{ pkgs ? import <nixpkgs> {} }:
let
  bazelOverride = pkgs.bazel_7.override {
    enableNixHacks = true;
  };
in
pkgs.mkShell {
  name = "env-shell";
  packages = with pkgs; [
    bazelOverride
    bash
    git
    python3
  ];
  inputsFrom = with pkgs; [
    jdk11
  ];
}
