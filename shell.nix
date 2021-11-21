with (import <nixpkgs> {});
gcc11Stdenv.mkDerivation {
  name = "fina-forth";
  buildInputs = [ gdb ];
  nativeBuildInputs = [ python git scons ];
  hardeningDisable = [ "all" ];
}
