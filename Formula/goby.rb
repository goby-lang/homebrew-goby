class Goby < Formula
  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://goby-lang.github.io/goby"
  url "https://github.com/goby-lang/goby/archive/v0.0.6.tar.gz"
  version "0.0.6"
  sha256 "3c3a4e1a237b52a56f4886f4950214402696469fb88402293907c8614823df6b"

  resource "goby" do
    url "https://github.com/goby-lang/goby/releases/download/v0.0.6/goby"
    sha256 "e6ec1b25531220d473819719829084b516272d4a93aceb821a63bd79c28577ba"
  end

  def install
    prefix.install "lib"

    resource("goby").stage do
      bin.install "goby"
    end
  end
end
