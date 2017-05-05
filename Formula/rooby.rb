class Rooby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://rooby-lang.github.io/rooby"
  url "https://github.com/rooby-lang/rooby/archive/0.0.1.tar.gz"
  version "0.0.1"
  sha256 "7e98f3a0d9dbc7e5997f3cf59a97c95fc9c2228c6df40f034fca8127b8786d11"

  def install
    bin.install "bin/rooby"
  end
end
