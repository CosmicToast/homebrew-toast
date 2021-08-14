class F2 < Formula
  desc "CLI tool for batch renaming files and directories"
  homepage "https://github.com/ayoisaiah/f2/"
  url "https://github.com/ayoisaiah/f2/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "a59be93e6c5dcfc2b2536fd5b04d526d254cbe193ea9d34e645d8941034b2c1b"
  license "MIT"
  head "https://github.com/ayoisaiah/f2.git", branch: "master"

  bottle do
    root_url "https://github.com/CosmicToast/homebrew-toast/releases/download/f2-1.7.1"
    sha256 cellar: :any_skip_relocation, catalina:     "da0eee77c9c817df07edbce5d9f944f830f04dec528d0ffc5890723697bb9d93"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f79747fd01f50e470767a2428d7bc955d2c36e776ec50e3e38be177705728bed"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/f2"
  end

  test do
    (testpath/"test1.txt").write("one\n")
    (testpath/"two.txt").write("two\n")
    system bin/"f2", "-f", "two", "-r", "test2", "-x"
    assert File.read("test2.txt").start_with?("two\n")
  end
end
