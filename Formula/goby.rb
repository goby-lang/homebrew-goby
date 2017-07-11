class Goby < Formula
  VERSION     = "0.0.8"
  GOBY_SHA256 = "8fca3aa960dcfaff3d4acd971d53977d98217d1b66bd2d7f543a28890845c1df"
  EXE_SHA256  = "e73f892374fe24632e0223e375bc37d101144d546f567d39f157b1f535a3f435"

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
    if ENV["GOBY_ROOT"].nil?
      puts ""
      puts "== Configuration Required =="
      puts ""
      puts "Put the following in a shell config flie. (eg. ~/.bash_profile, ~/.bashrc or ~/.zshrc)"
      puts "Goby will install all libraries to this directory."
      puts ""
      puts "export GOBY_ROOT=/usr/local/goby"
      puts ""
      odie "$GOBY_ROOT is not set."
    end

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
