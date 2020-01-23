# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk8-openj9-large' do
  version '8,242:b08'
  sha256 '8a98bdd88f1207782b7dbbc2b056ca4d577d753b6f05c7c6fc5e26f25ec4e7e7'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u242-b08_openj9-0.18.1/OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u242b08_openj9-0.18.1.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8 (OpenJ9) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u242b08_openj9-0.18.1.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.8-openj9.jdk'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.8-openj9.jdk'
end
