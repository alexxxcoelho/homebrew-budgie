# typed: strict
# frozen_string_literal: true

# Budgie Echo command-line interface.
class EchoCli < Formula
  desc "Local transcription, speech and BudgieScribe workflows from the terminal"
  homepage "https://gobudgie.com/echo"
  url "https://f003.backblazeb2.com/file/voxsprint-releases/echo-cli-0.8.3-macos-arm64.tar.gz"
  version "0.8.3"
  sha256 "89fc53a37f2e4f2ab091aeb2caff2e4390ccee2f6e246e337f228e3f8d90cd66"

  depends_on arch: :arm64
  depends_on macos: :monterey

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"echo-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/echo-cli --version")
  end
end
