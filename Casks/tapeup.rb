cask "tapeup" do
  version "0.1.3"
  sha256 "74ae4d96ac5c09be543228ca2e0b1c8d4f5f315e1f134bff856a7d53fa9419c6"

  url "https://github.com/kkyrian/tapeup/releases/download/v#{version}/TapeUp.dmg"
  name "TapeUp"
  desc "Meeting recorder built for you and your AI agent"
  homepage "https://github.com/kkyrian/tapeup"

  livecheck do
    url :url
    strategy :github_latest
  end

  # TapeUp updates itself through Sparkle.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "TapeUp.app"

  # Recordings in ~/TapeUp are the user's and stay.
  zap trash: [
    "~/Library/Application Support/TapeUp",
    "~/Library/Caches/io.github.kkyrian.TapeUp",
    "~/Library/HTTPStorages/io.github.kkyrian.TapeUp",
    "~/Library/Preferences/io.github.kkyrian.TapeUp.plist",
  ]

  caveats <<~EOS
    TapeUp is not notarized by Apple, so macOS stops it the first time.
    Open it once, then click Open Anyway in
    System Settings > Privacy & Security.
  EOS
end
