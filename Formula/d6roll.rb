class D6roll < Formula
  desc "Generate Diceware passphrases from the EFF long wordlist"
  homepage "https://github.com/kpb/d6roll"
  version "0.2.1"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/kpb/d6roll/releases/download/v0.2.1/d6roll_0.2.1_darwin_amd64.tar.gz"
      sha256 "6f645196865318cc6dade65369ff803eca090a70a8857467dfcba7cf4ddf872d"
    end

    on_arm do
      url "https://github.com/kpb/d6roll/releases/download/v0.2.1/d6roll_0.2.1_darwin_arm64.tar.gz"
      sha256 "dfb92ce4ec6c26775e696db66e0a6c7e1d43b6c7c587fe06fcfc3028687a323b"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/kpb/d6roll/releases/download/v0.2.1/d6roll_0.2.1_linux_amd64.tar.gz"
    sha256 "83cf45e87ba7371797711b7f283957b7ab441f9628cfe1a759d36a005e56079e"
  end

  def install
    bin.install "d6roll"
  end

  test do
    output = shell_output("#{bin}/d6roll -w 3")
    assert_equal 3, output.split.length
    assert_equal 1, output.lines.length
  end
end
