class Goby < Formula
  VERSION     = "0.1.13"
  GOBY_SHA256 = "73154c84457ecc66dcbbce7e3b560a1783c2aba604d07c78a1137b09ae3779a8"
  EXE_SHA256  = "2e6f880df97112303712bda452ceef57438f87ea76d0409546f0e7df5a519740"

  desc "Goby - Yet another programming language written in Go"
  homepage "https://goby-lang.org"
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
    (testpath/"hello.gb").write <<-EOS
    require "net/simple_server"

    s = Net::SimpleServer.new(3000)
    puts(s.port)
    EOS

    assert_equal "3000\n", shell_output("#{bin}/goby hello.gb")
  end
end
