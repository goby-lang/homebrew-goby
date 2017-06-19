class Goby < Formula
  VERSION     = "0.0.6"
  GOBY_SHA256 = "3c3a4e1a237b52a56f4886f4950214402696469fb88402293907c8614823df6b"
  EXE_SHA256  = "e6ec1b25531220d473819719829084b516272d4a93aceb821a63bd79c28577ba"

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

    target_dir = "#{ENV["GOBY_ROOT"]}/lib/#{VERSION}/stdlib"
    prefix.install "lib"
    system "mkdir", "-p", target_dir
    system "cp", "-R", prefix/"lib", target_dir

    resource("goby").stage do
      bin.install "goby"
    end
  end
end
