class Goby < Formula
  VERSION     = "0.0.9"
  GOBY_SHA256 = "bbde94fec185892f79eaddd82a040fa0a69a263264234f920c827c612f498b07"
  EXE_SHA256  = "b842cdcb0351edcfe266d1c18be100d152ef3c83e990209e88acff047bc1fa28"

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
    target_dir = "/usr/local/goby"
    prefix.install "lib"
    system "mkdir", "-p", target_dir
    system "cp", "-R", prefix/"lib", target_dir

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
