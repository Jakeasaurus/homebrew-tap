class Lazystatus < Formula
  desc "A TUI for monitoring status pages"
  homepage "https://github.com/jakeasaurus/lazystatus"
  version "0.3.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/jakeasaurus/lazystatus/releases/download/v0.3.0/lazystatus-darwin-arm64.tar.gz"
    sha256 "4baeda7718e516c8f3c9183840798f47b387fc530e2fd63b844fb05fba2617af"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/jakeasaurus/lazystatus/releases/download/v0.3.0/lazystatus-darwin-amd64.tar.gz"
    sha256 ""
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/jakeasaurus/lazystatus/releases/download/v0.3.0/lazystatus-linux-arm64.tar.gz"
    sha256 ""
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jakeasaurus/lazystatus/releases/download/v0.3.0/lazystatus-linux-amd64.tar.gz"
    sha256 ""
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "lazystatus-darwin-arm64" => "lazystatus"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "lazystatus-darwin-amd64" => "lazystatus"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "lazystatus-linux-arm64" => "lazystatus"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "lazystatus-linux-amd64" => "lazystatus"
    end
  end

  test do
    system "#{bin}/lazystatus", "--version"
  end
end
