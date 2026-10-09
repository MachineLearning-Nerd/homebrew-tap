class Taskhub < Formula
  desc "Command-line client and MCP server for TaskHub"
  homepage "https://github.com/MachineLearning-Nerd/taskhub-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v0.1.0/taskhub-cli-aarch64-apple-darwin.tar.xz"
      sha256 "cab23c7d6e0c477653e2484e93050df8906ab2644a1787fc076fbd901c1ead2e"
    end
    on_intel do
      url "https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v0.1.0/taskhub-cli-x86_64-apple-darwin.tar.xz"
      sha256 "6e63e2827c5a299b6a15968ff9f220d4ab2fc7a8da2fdfd4c7dbd9d8eec2c93e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v0.1.0/taskhub-cli-aarch64-unknown-linux-musl.tar.xz"
      sha256 "2d137ff7c4038b964ace0a8134da0d6660645288211fee3efd58516fce31d1a0"
    end
    on_intel do
      url "https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v0.1.0/taskhub-cli-x86_64-unknown-linux-musl.tar.xz"
      sha256 "2b34808fcb27178978219d10ecb2c8a2d3cd580a407b58dcdf7f83364761d2a9"
    end
  end

  def install
    bin.install "taskhub"
    man1.install "taskhub.1"
    bash_completion.install "completions/taskhub.bash" => "taskhub"
    zsh_completion.install "completions/_taskhub"
    fish_completion.install "completions/taskhub.fish"
  end

  test do
    assert_match "taskhub #{version}", shell_output("#{bin}/taskhub --version")
    assert_match "\"cli\":\"#{version}\"", shell_output("#{bin}/taskhub version --json")
  end
end
