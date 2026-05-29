cask "takt" do
  version "1.0.0"
  sha256 "2b48cd3beb381ec8ec0e2e20b48972e3e23aed18440252c7ab48b251f78a43d6"

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
