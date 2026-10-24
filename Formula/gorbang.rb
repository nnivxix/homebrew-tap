class Gorbang < Formula
  desc "Terminal UI to find and kill processes listening on TCP ports"
  homepage "https://github.com/nnivxix/gorbang"
  url "https://github.com/nnivxix/gorbang/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "055cf22a71ed9d65cf679cf7f36722705ac7dfdc09ec29fbd0af9eaa14eb02ad"
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
