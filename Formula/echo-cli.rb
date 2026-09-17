# typed: strict
# frozen_string_literal: true

# Budgie Echo command-line interface.
class EchoCli < Formula
  desc "Local transcription, speech and BudgieScribe workflows from the terminal"
  homepage "https://gobudgie.com/echo"
  url "https://f003.backblazeb2.com/file/voxsprint-releases/echo-cli-0.8.5-macos-arm64.tar.gz"
  version "0.8.5"
  sha256 "61882d4e3cc637292d764a6fb2d156f6b0454244ddddc7784d08c87d3cc6e42e"

  depends_on arch: :arm64
  depends_on macos: :monterey

  # Homebrew normally rewrites @rpath dylib IDs and ad-hoc signs the changed
  # files. That breaks hardened-runtime loading because echo-cli retains its
  # Developer ID Team ID. These libraries are already relocatable and signed.
  preserve_rpath

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"echo-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/echo-cli --version")
  end
end
