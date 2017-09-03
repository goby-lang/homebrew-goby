class Goby < Formula
  VERSION     = "0.1.2"
  GOBY_SHA256 = "5f01415f43a0478156b21263f69eac1337909383574d329103e4efae9ccfec75"
  EXE_SHA256  = "13e8e7604800d751c2c2ff8d2bda0e19cc285c3791ebb22c1de2d875b091b72d"

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
