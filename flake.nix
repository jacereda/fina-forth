{
  description = "FINA - FINA Is Not ANS Forth";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      cosmo = false;
      cosmoVars = ''
            export CC=cosmocc
            export OS=Cosmo
            export CFLAGS=-fno-strict-aliasing
            export
          '';
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      nativeBuildInputs = with pkgs;
        [ python3 clang-tools gdb ]
        ++ pkgs.lib.optional cosmo [ cosmocc cosmopolitan ];
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
            type foo | make tests
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
