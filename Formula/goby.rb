class Goby < Formula
  VERSION     = "0.1.8.1"
  GOBY_SHA256 = "9487da7b6d1e13f7d40379f8b11b6b79febf5036c9b3bb563cdedfa84e717968"
  EXE_SHA256  = "4031828e5c839b6aad8d102c0298c77dbab3b212e5eb97c1c7b0628f2091ffb8"

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
