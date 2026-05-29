class Takt < Formula
  desc "CLI client for Takt — schedule and monitor AI agents"
  homepage "https://github.com/TaktAgents/takt-cli"
  url "https://github.com/TaktAgents/takt/releases/download/v1.0.0/takt-cli.tar.gz"
  sha256 "b4ab9e2098b4c4f038705a858cfdd419b6a6b248457c8352bc19ab17a952d74e"
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
