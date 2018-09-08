with (import <nixpkgs> {});
stdenv.mkDerivation {
  name = "fina-forth";
  buildInputs = [ ];
  nativeBuildInputs = [ gcc gdb scons ];
}
