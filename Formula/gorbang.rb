class Gorbang < Formula
  desc "Terminal UI to find and kill processes listening on TCP ports"
  homepage "https://github.com/nnivxix/gorbang"
  url "https://github.com/nnivxix/gorbang/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "82c96f2b4e33716b6a0825d31d23ab477100f0ac8bfff31f2a3c9151d2f3f171"
  license "MIT"
  head "https://github.com/nnivxix/gorbang.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_predicate bin/"gorbang", :executable?
  end
end
