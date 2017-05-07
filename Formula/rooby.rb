class Rooby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://rooby-lang.github.io/rooby"
  url "https://github.com/rooby-lang/rooby/archive/0.0.1.tar.gz"
  version "0.0.1"
  sha256 "62eb814df953f3bc5277387f14aa53b6e0aa5ad9"

  def install
    bin.install "bin/rooby"
  end
end
