class Goby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://goby-lang.github.io/goby"
  url "https://github.com/goby-lang/goby/archive/v0.0.2.tar.gz"
  version "0.0.2"
  sha256 "3f45cbd042d2303ad2d0a54f7bc3dd2e2e1ec04867fbf287ddaa5f41c8781271"

  resource "goby" do
    url "https://github.com/goby-lang/goby/releases/download/v0.0.2/goby"
    sha256 "88930ccf70f6429d9e0a1ce898e3cb49d8a056f9b342230d0770719b6fd9f432"
  end

  def install
    resource("goby").stage do
      bin.install "goby"
    end
  end
end
