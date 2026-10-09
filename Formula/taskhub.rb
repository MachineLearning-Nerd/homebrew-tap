class Taskhub < Formula
  desc "Command-line client and MCP server for TaskHub"
  homepage "https://github.com/MachineLearning-Nerd/taskhub-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v0.1.1/taskhub-cli-aarch64-apple-darwin.tar.xz"
      sha256 "247612cefb4ccd75c2993cbc2292170d3b67b43f8718d713bebc1bc65d919a93"
    end
    on_intel do
      url "https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v0.1.1/taskhub-cli-x86_64-apple-darwin.tar.xz"
      sha256 "0ec6acc4f3751f4dd9dbd2c8c6b070eaad96d45408b1ef0e476c7cc5e9304f5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v0.1.1/taskhub-cli-aarch64-unknown-linux-musl.tar.xz"
      sha256 "5458ac3671d39b4579809b08a931d7544948f5e164e38edf007b4ecdfcd2aac9"
    end
    on_intel do
      url "https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v0.1.1/taskhub-cli-x86_64-unknown-linux-musl.tar.xz"
      sha256 "3f0d34263f734f00a00850f5f2a6030d521737eaa083e95d404b7bb86a46308d"
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
