class Gorbang < Formula
  desc "Terminal UI to find and kill processes listening on TCP ports"
  homepage "https://github.com/nnivxix/gorbang"
  url "https://github.com/nnivxix/gorbang/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "b5b1ed573d58029b5ae68f06355c27d8ef3b274ac14023304afb38ddb4b5b74d"
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
