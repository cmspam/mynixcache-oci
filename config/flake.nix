{
  description = "VM System Configuration";

  inputs = {
    # 1. Standard NixOS stable/unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # 2. Pull your Driver Flake from GitHub
    # Replace 'youruser' and 'xe-native-context-nix' with your actual details
    xe-driver-flake.url = "github:cmspam/xe-native-context-nix";
  };

  outputs = { self, nixpkgs, xe-driver-flake, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import your local files
        ./configuration.nix

        # Import the module FROM the GitHub flake
        xe-driver-flake.nixosModules.default
      ];
    };
  };
}
