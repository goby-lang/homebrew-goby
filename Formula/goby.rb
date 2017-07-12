class Goby < Formula
  VERSION     = "0.0.9"
  GOBY_SHA256 = "81b0fcff37b5f709aeff4c81a152f6fdae2bfa446293c5139064cb8e113ff99c"
  EXE_SHA256  = "63bbea1862ce1c7b9fa168f0891c7f5b0d9f76721957fc3606d2f5cbacf3f8d0"

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
