class Goby < Formula
  VERSION     = "0.1.10"
  GOBY_SHA256 = "ef150b371955b2a8202d121f19eed6b88bdf763965a7a6a060c1006fda3ebb28"
  EXE_SHA256  = "4582e77a680c78672dcbc8034abdf6b84d48b09f70cee19f8e5509e5434755b8"

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
