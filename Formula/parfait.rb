class Parfait < Formula
    desc "A command-line tool for creating and managing cloudformation stacks"
    homepage "https://github.com/lox/parfait"
    version "1.1.3"

    if OS.mac?
      url "https://github.com/lox/parfait/releases/download/v1.1.3/parfait_darwin_amd64"
      sha256 "cf842d7ad394f1c4e64fcc3cdaaec40a475358cb896d77cc1ee4cdbfc93f723a"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/lox/parfait/releases/download/v1.1.3/parfait_linux_amd64"
        sha256 "3e4df027d160da4556790968544b52a97e572018aededc41045095490f856db9"
      end
    end

    def install
      mv "parfait_darwin_amd64", "parfait"
      bin.install "parfait"
    end
  end
