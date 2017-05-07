class Rooby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://rooby-lang.github.io/rooby"
  url "https://github.com/rooby-lang/rooby/archive/0.0.1.tar.gz"
  version "0.0.1"
  sha256 "dee9bf61fb9740dc18e0200a1cce93fcce98f3ac0cd85fc6c924dcdca961fa6e"

  def install
    bin.install "bin/rooby"
  end
end
