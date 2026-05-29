class Takt < Formula
  desc "CLI client for Takt — schedule and monitor AI agents"
  homepage "https://github.com/TaktAgents/takt-cli"
  url "https://github.com/TaktAgents/takt/releases/download/v1.0.0/takt-cli.tar.gz"
  sha256 "3f7bc287081218a7b192b0081f6d023673c9bce0bb02e5672718b3d9a15ff1a1"
  license "MIT"

  depends_on "bun"

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
