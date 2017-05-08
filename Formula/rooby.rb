class Rooby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://rooby-lang.github.io/rooby"
  url "https://github.com/rooby-lang/rooby/archive/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "b866dd040fb1e66b2d16a71e954fa35701ed7794f2d6d8151496947678ff5461"

  def install
    bin.install "bin/rooby"
  end
end
