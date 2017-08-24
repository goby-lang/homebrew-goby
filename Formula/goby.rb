class Goby < Formula
  VERSION     = "0.1.1"
  GOBY_SHA256 = "e543e4290253f6fed565f9b5c3c759064bc20d3a3d44bec9f7a9903f0f7f51bd"
  EXE_SHA256  = "e415e28e7bb9471cc66eed3e2dbff3e2b7b6e696efcccccf1454b22cde0d2a63"

  desc "A new object oriented language written in Go aim at developing microservice efficiently."
  homepage "https://goby-lang.github.io/goby"
  url "https://github.com/goby-lang/goby/archive/v#{VERSION}.tar.gz"
  version VERSION
  sha256 GOBY_SHA256

  resource "goby" do
    url "https://github.com/goby-lang/goby/releases/download/v#{VERSION}/goby"
    sha256 EXE_SHA256
  end

  def install
    prefix.install "lib"

    resource("goby").stage do
      bin.install "goby"
    end
  end

  test do
    (testpath/"hello.gb").write <<-EOS.undent
    require "net/simple_server"

    s = Net::SimpleServer.new(3000)
    puts(s.port)
    EOS

    assert_equal "3000\n", shell_output("#{bin}/goby hello.gb")
  end
end
