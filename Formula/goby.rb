class Rooby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://goby-lang.github.io/goby"
  url "https://github.com/goby-lang/goby/archive/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "c6f8fc204bac2fff1fe9bd61849e147db74517cab3c219b31fab370e40e1db09"

  resource "goby" do
    url "https://github.com/goby-lang/goby/releases/download/v0.0.1/goby"
    sha256 "5825eb9a5d792a6b0918da7e02c2f45dce559aceb80824f9ffd363eb413c6934"
  end

  def install
    resource("goby").stage do
      bin.install "goby"
    end
  end
end
