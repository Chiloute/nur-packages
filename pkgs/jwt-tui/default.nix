{
  lib,
  buildGo126Module,
  fetchFromGitHub,
}:
buildGo126Module rec {
  pname = "jwt-tui";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "Chiloute";
    repo = "jwt-tui";
    rev = "v${version}";
    hash = "sha256-rEfnoKzhU1cAOfpN7TsRl9062gsUBo5qsR6FimQjelA=";
  };

  vendorHash = "sha256-dgfH1uy2OK/EScmt+dsHwxO0bNObdKTDCMNN3MyPJ5k=";

  ldflags = ["-s" "-w" "-X main.version=${version}"];

  meta = with lib; {
    description = "A TUI to decode, tamper with, and re-sign JSON Web Tokens (HMAC, RSA, ECDSA, Ed25519).";
    homepage = "https://github.com/Chiloute/jwt-tui";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = [];
    mainProgram = "jwt-tui";
  };
}
