class Gorbang < Formula
  desc "Terminal UI to find and kill processes listening on TCP ports"
  homepage "https://github.com/nnivxix/gorbang"
  url "https://github.com/nnivxix/gorbang/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "fd2ab26e63cd6342e59c8fcc71264ceda074e9b2856adb588d53ca9c82e3d33f"
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
