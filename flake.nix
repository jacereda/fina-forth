{
  description = "FINA - FINA Is Not ANS Forth";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      cosmo = true;
#      cosmocc-3-bin = pkgs.callPackage ./cosmocc-3-bin.nix {};
      cosmocc-4-bin = pkgs.callPackage ./cosmocc-4-bin.nix {};
      cosmoVars = ''
            export CC=${cosmocc-4-bin}/bin/x86_64-unknown-cosmo-cc
            export AS=${cosmocc-4-bin}/cosmocc/bin/x86_64-unknown-cosmo-as
            export OS=Cosmo
            export DCE=
            export LTO=
          '';
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
#      cosmocc-4 = pkgs.callPackage ./cosmopolitan.nix { inherit cosmocc-3-bin; };
      nativeBuildInputs = with pkgs;
        [ python3 clang-tools gdb ]
        ++ pkgs.lib.optional cosmo [  ];
      buildInputs = with pkgs; [ ];
    in
    {
      packages.${system} = rec {
        default = pkgs.stdenv.mkDerivation {
          pname = "fina";
          version = "0.0.0";

          src = ./.;

          inherit nativeBuildInputs;
          inherit buildInputs;

          dontUseCmakeConfigure = true;
          dontUseGnuMakeConfigure = true;

          configurePhase = pkgs.lib.optionalString cosmo cosmoVars;

          buildPhase = ''
            make -j$(nproc)
          '';

          installPhase = ''
            make install PREFIX=$out
          '';

          checkPhase = ''
            echo foo | make tests
          '';

          meta = with pkgs.lib; {
            description = "FINA - FINA Is Not ANS Forth";
            homepage = "https://github.com/jacereda/fina-forth";
            license = licenses.bsd3;
          };
        };
      };

      devShells.${system} = rec {
        default = pkgs.mkShell {
          packages = nativeBuildInputs ++ buildInputs;
          shellHook = ''
            export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
                                    pkgs.glibc
            ]}
          '' + pkgs.lib.optionalString cosmo cosmoVars;
        };
      };
    };
}
