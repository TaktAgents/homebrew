cask "takt" do
  version "1.0.0"
  sha256 "fe9bd02a30290a16388de1e557b3f8b4635d8e42c684512498848fb2c9d0a2aa"

  url "https://github.com/TaktAgents/takt/releases/download/v#{version}/Takt.zip"
  name "Takt"
  desc "Native macOS menu bar utility for scheduling AI CLI agents"
  homepage "https://github.com/TaktAgents/takt"

  app "Takt.app"

  zap trash: [
    "~/Library/Application Scripts/com.taktagents.takt",
    "~/Library/Containers/com.taktagents.takt",
    "~/Library/Preferences/com.taktagents.takt.plist",
    "~/Library/Caches/com.taktagents.takt",
  ]
end
