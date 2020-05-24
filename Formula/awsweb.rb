  
# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula

class Awsweb < Formula
  desc "Hop between AWS accounts and profiles without going through the regular username + password, switch role, switch region dance"
  homepage "https://github.com/glassechidna/awsweb"
  version "0.1.7"
  url "https://github.com/glassechidna/awsweb/releases/download/#{version}/awsweb_#{version}_Darwin_x86_64.tar.gz" 
  sha256 "0dc6fb9ccc8147b3eb55ae429a8a159b4a03c6e01a1a9138cb2f596547829f6c"

  bottle :unneeded 

  def install
    bin.install "awsweb"
  end

  test do
    system "awsweb -h"
  end
end