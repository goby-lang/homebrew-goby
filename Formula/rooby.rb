class Rooby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://rooby-lang.github.io/rooby"
  url "https://github.com/rooby-lang/rooby/archive/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "b866dd040fb1e66b2d16a71e954fa35701ed7794f2d6d8151496947678ff5461"

  resource "rooby" do
    url "https://github.com/rooby-lang/rooby/releases/download/v0.0.1/rooby"
    sha256 "7994dfb02b49c12b3c0946dfb2d35ecd8955137022aa59a2c7491f4cc86b1f4a"
  end

  def install
    resource("rooby").stage do
      bin.install "rooby"
    end
  end
end
