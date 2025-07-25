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
    
    # Install shell completions if they exist
    if (libexec/"scripts/shell/azt-completion.bash").exist?
      bash_completion.install libexec/"scripts/shell/azt-completion.bash" => "azt"
    end
    
    if (libexec/"scripts/shell/azt-completion.zsh").exist?
      zsh_completion.install libexec/"scripts/shell/azt-completion.zsh" => "_azt"
    end
  end

  test do
    # Test that the binary is installed and working
    assert_match version.to_s, shell_output("#{bin}/azt --version")
    
    # Test basic functionality
    system "#{bin}/azt", "--help"
  end

  def caveats
    <<~EOS
      AZT CLI has been installed successfully!
      
      To get started:
        1. Initialize a new project: azt init
        2. View available commands: azt --help
        3. Read the documentation: https://github.com/azertica/azt
      
      Shell completion has been installed for bash and zsh.
      You may need to restart your shell or source your profile.
      
      For more information and examples, visit:
      https://github.com/azertica/azt/blob/main/README.md
    EOS
  end
end