{pkgs, ...}:
let
  buildbox-common = pkgs.stdenv.mkDerivation {
    name = "buildbox-common";
    src = pkgs.fetchFromGitLab {
      owner = "BuildGrid";
      repo = "buildbox/buildbox-common";
      rev = "1.0.10";
      sha256 = "sha256-abCVqZ1BHLGTKpa1Puh5Xea+xFy9gygs3WenZrgAaJs=";
    };
    buildInputs = with pkgs; [
      cmake
      gcc
      gnumake
      pkg-config
      protobuf
      grpc
      abseil-cpp
      gbenchmark
      c-ares
      openssl
      libuuid
      glog
      gflags
      gtest
    ];
  };
in
pkgs.stdenv.mkDerivation {
  name = "recc";
  src = pkgs.fetchFromGitLab {
    # https://gitlab.com/BuildGrid/recc.git
    owner = "BuildGrid";
    repo = "recc";
    rev = "1.1.3";
    sha256 = "sha256-Yw5aXUQwCl8pEVSrhTUuQoZkxo7BdjHuSo5OPrESEDM=";
  };
  buildInputs = with pkgs; [
    cmake
    gcc
    gnumake
    pkg-config
    protobuf
    grpc
    abseil-cpp
    gbenchmark
    c-ares
    openssl
    libuuid
    glog
    gflags
    gtest
    buildbox-common
  ];
}
