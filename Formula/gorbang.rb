class Gorbang < Formula
  desc "Terminal UI to find and kill processes listening on TCP ports"
  homepage "https://github.com/nnivxix/gorbang"
  url "https://github.com/nnivxix/gorbang/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "f27e06feed10ed4d87133381ff955bd0505f798fc9aca4ee7f3936ad92550da8"
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
