{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage rec {
  pname = "cfdyndns";
  version = "0.1.1";
  src = fetchFromGitHub {
    owner = "nrdxp";
    repo = "cfdyndns";
    rev = "v${version}";
    hash = "sha256-O2+2zXbfkAwAh42XsmXX7/pNUllG4rKECuifQnebBYA=";
  };

  cargoLock.lockFile = "${src}/Cargo.lock";
  cargoLock.outputHashes."cloudflare-0.10.1" = "sha256-AJW4AQ34EDhxf7zMhFY2rqq5n4IaSVWJAYi+7jXEUVo=";
  cargoLock.outputHashes."public-ip-0.2.2" = "sha256-DDdh90EAo3Ppsym4AntczFuiAQo4/QQ9TEPJjMB1XzY=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "CloudFlare Dynamic DNS Client";
    homepage = "https://github.com/colemickens/cfdyndns";
    license = lib.licenses.mit;
    maintainers = with maintainers; [ colemickens nrdxp ];
    platforms = with platforms; linux;
  };
}
