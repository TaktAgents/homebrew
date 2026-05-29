class Takt < Formula
  desc "CLI client for Takt — schedule and monitor AI agents"
  homepage "https://github.com/TaktAgents/takt-cli"
  url "https://github.com/TaktAgents/takt/releases/download/v1.0.0/takt-cli.tar.gz"
  sha256 "d611dd56489f35e873ad5299b5de45b2f09e0fad5645a47bfcf81770275af840"
  license "MIT"

  env :std


  def install
    # Установка исходных файлов в libexec (Homebrew standard for private app code)
    libexec.install Dir["*"]

    # Запуск bun install внутри libexec
    cd libexec do
      system "bun", "install", "--production"
    end

    # Создание исполняемого скрипта takt в bin
    (bin/"takt").write <<~EOS
      #!/bin/bash
      exec bun "#{libexec}/index.ts" "$@"
    EOS
  end

  test do
    system "#{bin}/takt", "--version"
  end
end
