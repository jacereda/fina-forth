{
  description = "FINA - FINA Is Not ANS Forth";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      cosmocc-4-bin = pkgs.callPackage ./cosmocc-4-bin.nix {};
      libffi-cosmo = pkgs.callPackage ./libffi-cosmo.nix {pkgs=pkgs.pkgsCross.gnu64; inherit cosmocc-4-bin;};
      cosmoVars = ''
#        export CC=${cosmocc-4-bin}/bin/x86_64-unknown-cosmo-cc
        export CC=${cosmocc-4-bin}/bin/cosmocc
        export CPP=${cosmocc-4-bin}/bin/x86_64-unknown-cosmo-cc
        export FFI=0
        export OS=Cosmo
        export LTO=
        export DCE=
        export EXE=.com
        export QEMU="$QEMU /usr/bin/env sh -c"
      '';

      qemuMap = {
        i686    = "i386";
        armv7l = "arm";
        powerpc = "ppc";
      };

      cpuMap = {
        armv7l = "arm";
      };

      crossTargets = {
        x86_64 = {
          pkgs = pkgs.pkgsCross.musl64;
        };

        x86_64-static = {
          pkgs = pkgs.pkgsCross.musl64.pkgsStatic;
        };

        i686 = {
          pkgs = pkgs.pkgsCross.musl32;
        };

        i686-static = {
          pkgs = pkgs.pkgsCross.musl32.pkgsStatic;
        };

        arm = {
          pkgs = pkgs.pkgsCross.armv7l-hf-multiplatform-musl;
        };

        arm-static = {
          pkgs = pkgs.pkgsCross.armv7l-hf-multiplatfor-musl.pkgsStatic;
        };

        aarch64 = {
          pkgs = pkgs.pkgsCross.aarch64-multiplatform-musl;
        };

        aarch64-static = {
          pkgs = pkgs.pkgsCross.aarch64-multiplatform-musl.pkgsStatic;
        };

        powerpc = {
          pkgs = pkgs.pkgsCross.ppc32-multiplatform-musl;
        };

        powerpc-static = {
          pkgs = pkgs.pkgsCross.ppc32-multiplatform-musl.pkgsStatic;
        };

        cosmo = {
          pkgs = pkgs.pkgsCross.gnu64;
          extraConfigure = cosmoVars;
        };
      };

      gnativeBuildInputs = with pkgs; [
        python3
        gdb
        git
        qemu
        clang-tools
      ];

      mkFina = name: target:
        let
          crossPkgs = target.pkgs;
          extraConfigure = target.extraConfigure or "";
          libffi = if name == "cosmo" then libffi-cosmo else crossPkgs.pkgsStatic.libffi;
        in
        crossPkgs.stdenv.mkDerivation {
          pname = "fina";
          version = "0.3-${name}";
          src = ./.;

          nativeBuildInputs = gnativeBuildInputs ++ [ libffi ];

          strictDeps = true;

          dontUseCmakeConfigure = true;
          dontUseGnuMakeConfigure = true;

          configurePhase = ''
            export CPPFLAGS=-I${libffi.dev}/include
            export LDFLAGS=-L${libffi.out}/lib
            export CPU=${nixpkgs.lib.attrByPath
              [ crossPkgs.stdenv.hostPlatform.parsed.cpu.name ]
              crossPkgs.stdenv.hostPlatform.parsed.cpu.name
              cpuMap};
            export QEMU=qemu-${nixpkgs.lib.attrByPath
              [ crossPkgs.stdenv.hostPlatform.parsed.cpu.name ]
              crossPkgs.stdenv.hostPlatform.parsed.cpu.name
              qemuMap};
            ${extraConfigure}
          '';

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
            platforms = platforms.linux;
          };
        };
    in
    {
      packages.${system} =
        (nixpkgs.lib.mapAttrs mkFina crossTargets)
        // {
          libffi-cosmo = libffi-cosmo;
        };

      defaultPackage.${system} =
        self.packages.${system}.x86_64;

      devShells.${system} =
        nixpkgs.lib.mapAttrs (name: target:
          let
            crossPkgs = target.pkgs;
            extraConfigure = target.extraConfigure or "";
            libffi = if name == "cosmo" then libffi-cosmo else crossPkgs.pkgsStatic.libffi;
          in
            crossPkgs.mkShell {
              nativeBuildInputs = gnativeBuildInputs ++ [ libffi ];
              shellHook = ''
                export CPPFLAGS=-I${libffi.dev}/include
                export LDFLAGS=-L${libffi.out}/lib
                export CPU=${nixpkgs.lib.attrByPath
                  [ crossPkgs.stdenv.hostPlatform.parsed.cpu.name ]
                  crossPkgs.stdenv.hostPlatform.parsed.cpu.name
                  cpuMap};
                export QEMU=qemu-${nixpkgs.lib.attrByPath
                  [ crossPkgs.stdenv.hostPlatform.parsed.cpu.name ]
                  crossPkgs.stdenv.hostPlatform.parsed.cpu.name
                  qemuMap};

              ${extraConfigure}
            '';
            }
        ) crossTargets;
    };
}
