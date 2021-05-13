with (import <nixpkgs> {});
gccStdenv.mkDerivation {
  name = "fina-forth";
  buildInputs = [];
  nativeBuildInputs = [ python ];
}
