class Goby < Formula
  VERSION     = "0.1.8"
  GOBY_SHA256 = "4d01a2abc4da0dcb1de2093dd1e1d4557a7274219b7023cbf794073c7ed3fe03"
  EXE_SHA256  = "091382a7c4a27ccd99ba044e1cc0ce0cad6be2fff7327dd5375b7b3890b271e7"

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
