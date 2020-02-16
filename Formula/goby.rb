class Goby < Formula
  VERSION     = "0.1.12"
  GOBY_SHA256 = "08374e8fcfa89ffca8e7086135971517d5460dd9ac4d4be54938cde0ca1b1b32"
  EXE_SHA256  = "d2779ad65ac01dd3984dfbc64ff89765094f4a417e16036ba066695dc3b7161c"

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
