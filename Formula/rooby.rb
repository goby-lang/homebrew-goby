class Rooby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://rooby-lang.github.io/rooby"
  url "https://github.com/rooby-lang/rooby/archive/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "672a9eeb355743c51ca512f5348f0d01359f3820fc7d2977e1a9cddb799bd735"

  def install
    bin.install "bin/rooby"
  end
end
