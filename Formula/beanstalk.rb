# typed: false
# frozen_string_literal: true

class Beanstalk < Formula
  desc "Terminal-native implementation of the Beans task-file format"
  homepage "https://github.com/kpb/beanstalk"
  version "0.4.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kpb/beanstalk/releases/download/v0.4.0/beanstalk_0.4.0_darwin_amd64.tar.gz"
      sha256 "2ed2d0d70d8d66812905ba60253c87dd8ca4b4940676fee437a032e90e226317"
    end

    if Hardware::CPU.arm?
      url "https://github.com/kpb/beanstalk/releases/download/v0.4.0/beanstalk_0.4.0_darwin_arm64.tar.gz"
      sha256 "8e6e4549f700452f0afa5bc4e7c58f0e635d0b129f6d319a7c6babb5513d40d0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/kpb/beanstalk/releases/download/v0.4.0/beanstalk_0.4.0_linux_amd64.tar.gz"
      sha256 "19a25ddcbb7a19955009be649751a9be489d533cf194aa33da0105a9c11661e2"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kpb/beanstalk/releases/download/v0.4.0/beanstalk_0.4.0_linux_arm64.tar.gz"
      sha256 "48ff8b6e475128e50b64309155b9d6c6138c7d639e804a52613c5f30d3efc1fe"
    end
  end

  def install
    bin.install "beanstalk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beanstalk version")
  end
end
