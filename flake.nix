{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, ... }:
    {
      nixosModules.default = { config, ... }: {
        services.xserver.enable = false;
        services.xserver.xkb = {
          layout = "hu";
          extraLayouts.hu-custom = {
            languages = [ "hu" ];
            description = "HU with remaps";
            symbolsFile = ./linux/xkb/symbols/custom;
          };
        };
      };
    };
}
