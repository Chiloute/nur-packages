{
  lib,
  buildGo126Module,
  fetchFromGitHub,
}:
buildGo126Module rec {
  pname = "jwt-tui";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Chiloute";
    repo = "jwt-tui";
    rev = "v${version}";
    hash = "sha256-fI52y895BCSlxfPoFaeBMgt1EYwRhEEHJNvG3izKBTk=";
  };

  vendorHash = "sha256-utC0yNPw0VovWs5kxhhXAUgk7D35sDCldNKZKc4hyvI=";

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
