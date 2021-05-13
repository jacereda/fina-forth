with (import <nixpkgs> {});
gccStdenv.mkDerivation {
  name = "fina-forth";
  buildInputs = [ gdb ];
  nativeBuildInputs = [ python ];
}
