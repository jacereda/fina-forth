{ stdenv, fetchzip, lib, makeWrapper, ... }:

stdenv.mkDerivation rec {
  pname = "cosmocc-bin";
  version = "4.0.2";

  src = fetchzip {
    url = "https://github.com/jart/cosmopolitan/releases/download/${version}/cosmocc-${version}.zip";
    sha256 = "sha256-6KZv7KU2rJhwfc9k6z9I6ZdfIS1KqRFLZUo8YyuD7ZY=";
    stripRoot = false;
  };

  nativeBuildInputs = [ makeWrapper ];
  buildPhase = ''
  '';
  installPhase = ''
    install -d $out
    cp -ar $src/* $out/
    chmod +w -R $out/
    chmod +x `find $out/bin`
    chmod +x `find $out/libexec`
    for i in `find $out/bin -type f -executable` `find $out/libexec -type f -executable` ; do
      if [ -x "$i" ]; then
         touch $i.out
         $i --assimilate || true
         $i --version > $i.out || true
         # wrapProgram $i
         # $i --version > $i.out2 || true
      fi
    done
  '';

  meta = with lib; {
    description = "Cosmopolitan C Compiler (cosmocc)";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
  };
}
