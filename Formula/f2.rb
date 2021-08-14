class F2 < Formula
  desc "F2 is a cross-platform command-line tool for batch renaming files and directories quickly and safely. Written in Go!"
  homepage "https://github.com/ayoisaiah/f2/"
  head "https://github.com/ayoisaiah/f2.git"
  url "https://github.com/ayoisaiah/f2/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "a59be93e6c5dcfc2b2536fd5b04d526d254cbe193ea9d34e645d8941034b2c1b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/f2"
  end

  test do
    (testpath/"test1.txt").write("one\n")
    (testpath/"two.txt").write("two\n")
    system bin/"f2", "-f", "two", "-r", "test2", "-x"
    assert File.read("test2.txt").start_with?("two\n")
  end
end
