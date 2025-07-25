class Azt < Formula
  desc "Azertica Build Tool - Comprehensive CLI for project management and development workflow"
  homepage "https://github.com/azertica/azt"
  url "https://github.com/azertica/azt/archive/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256_HASH"
  license "MIT"
  version "1.0.0"
  head "https://github.com/azertica/azt.git", branch: "main"

  depends_on "node" => :build
  depends_on "npm" => :build

  def install
    # Install npm dependencies and build
    system "npm", "install", "--production"
    system "npm", "run", "build"
    
    # Install to libexec to avoid conflicts
    libexec.install Dir["*"]
    
    # Create wrapper script that uses the system node
    (bin/"azt").write <<~EOS
      #!/bin/bash
      exec node "#{libexec}/dist/cli.js" "$@"
    EOS
    
    # Make the wrapper executable
    chmod 0755, bin/"azt"
    
    # Install shell completions if they exist
    if File.exist?("scripts/shell/azt-completion.bash")
      bash_completion.install "scripts/shell/azt-completion.bash" => "azt"
    end
    
    if File.exist?("scripts/shell/azt-completion.zsh")
      zsh_completion.install "scripts/shell/azt-completion.zsh" => "_azt"
    end
  end

  test do
    # Test that the binary is installed and working
    assert_match version.to_s, shell_output("#{bin}/azt --version")
    
    # Test basic functionality
    system "#{bin}/azt", "--help"
    
    # Test that it can show commands
    output = shell_output("#{bin}/azt --help")
    assert_match "Commands:", output
    assert_match "build", output
    assert_match "test", output
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