class Androidmigrate < Formula
  include Language::Python::Virtualenv

  desc "Checkpointed Android folder backup and sync over ADB"
  homepage "https://github.com/MachineLearning-Nerd/AndroidMigrate"
  url "https://github.com/MachineLearning-Nerd/AndroidMigrate/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "5e9234af09ede3f0838fbbed4ef85a6e144507ed9d1936f596776e5512a68b6b"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      androidmigrate requires adb (Android Debug Bridge) to communicate with devices.
      Install it via:
        brew install --cask android-platform-tools
    EOS
  end

  test do
    assert_match "usage:", shell_output("#{bin}/androidmigrate --help", 0)
  end
end
