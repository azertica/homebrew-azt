class Azt < Formula
  desc "Azertica Build Tool - Comprehensive CLI for project management and development workflow"
  homepage "https://github.com/azertica/azt"
  url "https://registry.npmjs.org/@azertica/azt-cli/-/azt-cli-1.0.0.tgz"
  sha256 "f08362dc1f43c89a6ac991986fe94af278af991785108d45700de0bda0c8e028"
  license "MIT"
  version "1.0.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Test that the binary is installed and working
    assert_match version.to_s, shell_output("#{bin}/azt --version")
    
    # Test basic functionality
    system "#{bin}/azt", "--help"
  end
end