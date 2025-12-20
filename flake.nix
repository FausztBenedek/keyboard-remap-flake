{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosModules.default = { config, ... }: {
        services.xserver.enable = false;
        services.xserver.xkb = {
          layout = "hu";
          extraLayouts.hu-custom = {
            languages = [ "hu" ];
            description = "HU with remaps";
            symbolsFile = ./linux/hu-custom.xkb;
          };
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          xorg.xkbcomp
          xorg.xkbutils
          xorg.setxkbmap
          weston
          wtype
          wev
          libgnomekbd
        ];

        shellHook = ''
          # export XKB_CONFIG_ROOT="$PWD/linux"
          # export XKB_DEFAULT_LAYOUT=hu
          # export XKB_DEFAULT_VARIANT=custom
          # export XKB_CONFIG_ROOT=$(pwd)/linux 
          export XKB_CONFIG_ROOT=${pkgs.xkeyboard-config}/etc/X11/xkb
          export XKB_CONFIG_EXTRA_PATH=$PWD/linux
          echo "XKB dev environment ready"

          echo "Started shell"
        '';
      };
    };
}
