class D6roll < Formula
  desc "Generate Diceware passphrases from the EFF long wordlist"
  homepage "https://github.com/kpb/d6roll"
  version "0.3.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/kpb/d6roll/releases/download/v0.3.0/d6roll_0.3.0_darwin_amd64.tar.gz"
      sha256 "154765b730cdbc8a3737feb07c1cdc8012f62e48e01307c0c987e34b050f40f9"
    end

    on_arm do
      url "https://github.com/kpb/d6roll/releases/download/v0.3.0/d6roll_0.3.0_darwin_arm64.tar.gz"
      sha256 "18783e9874fe693f7c77f0f86934f20b36c7cf4d72cd83a4f33e1a94df630c62"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/kpb/d6roll/releases/download/v0.3.0/d6roll_0.3.0_linux_amd64.tar.gz"
    sha256 "d7730adff81d1e3b395ae78ac6c49aad6300fc1fac684888ae8ee64b1ab000e9"
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
