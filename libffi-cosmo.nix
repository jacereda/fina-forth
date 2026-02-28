{ pkgs
, cosmocc-4-bin
}:

pkgs.stdenv.mkDerivation rec {
  pname = "libffi-cosmo";
  version = pkgs.libffi.version;

  src = pkgs.libffi.src;

  patches = pkgs.libffi.patches;

  strictDeps = pkgs.libffi.strictDeps;

  outputs = [
    "out"
    "dev"
  ];

  configurePlatforms = [
    "host"
  ];

  nativeBuildInputs = pkgs.libffi.nativeBuildInputs;

  dontDisableStatic = true;

  configureFlags = [
    "--enable-static"
    "--disable-raw-api"
    "--disable-shared"
    "--disable-docs"
    "--with-gcc-arch=generic"
    "--enable-pax_emutramp"
  ];

  preConfigure = ''
#NOTYET    export CC=${cosmocc-4-bin}/bin/cosmocc
    export CC=${cosmocc-4-bin}/bin/x86_64-unknown-cosmo-cc
    export CPP=${cosmocc-4-bin}/bin/x86_64-unknown-cosmo-cc
    export TMPDIR=.
  '';

  postConfigure = ''
    echo '#define __linux__ 1' >> x86_64-unknown-linux-gnu/fficonfig.h
    echo '#define off_t ssize_t' >> x86_64-unknown-linux-gnu/fficonfig.h
    echo '#define NO_JAVA_RAW_API' >> x86_64-unknown-linux-gnu/fficonfig.h
    echo '#undef HAVE_MEMFD_CREATE' >> x86_64-unknown-linux-gnu/fficonfig.h

  '';

  meta = with pkgs.lib; {
    description = "libffi built with Cosmopolitan libc";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
}
