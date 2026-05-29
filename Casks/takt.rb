cask "takt" do
  version "1.0.0"
  sha256 "abb86ab711cc1e4d260fcbb73458038f1d4b270ad58019b9fb8c1a1067d2d616"

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
