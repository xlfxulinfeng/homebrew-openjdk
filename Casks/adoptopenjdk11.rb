# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk11" do
  version "11.0.9,11"
  sha256 "aad2e32d0bd9a2170dc2244d590fcd571f660839fe4ccc971114dfd2d2968f01"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.9%2B11/OpenJDK11U-jdk_x64_mac_hotspot_11.0.9_11.pkg"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 11"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK11U-jdk_x64_mac_hotspot_11.0.9_11.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.11.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.11.jdk"
end
