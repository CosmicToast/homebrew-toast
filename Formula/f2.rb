class F2 < Formula
  desc "CLI tool for batch renaming files and directories"
  homepage "https://github.com/ayoisaiah/f2/"
  url "https://github.com/ayoisaiah/f2/archive/refs/tags/v1.7.2.tar.gz"
  sha256 "5c44d9d7bbd428e7c0d1a37118fbfec47b38dbb708501a2b3adc4f4da3e049ef"
  license "MIT"
  head "https://github.com/ayoisaiah/f2.git", branch: "master"

  bottle do
    root_url "https://github.com/CosmicToast/homebrew-toast/releases/download/f2-1.7.2"
    sha256 cellar: :any_skip_relocation, catalina:     "e1065fd538180b6984b67ca49257181c3282787e713c8bd12be60c396093d8ce"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "99136a77d01f1681e86235d630392db823de254e219ecb69488ce7339be538e4"
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
