class Lazystatus < Formula
  desc "🔍 A modern TUI for monitoring status pages"
  homepage "https://github.com/jakeasaurus/lazystatus"
  url "https://github.com/jakeasaurus/lazystatus/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "ef48aee1c5755d29e03d4db42483deded30e77d717e58b174a8db0c0c0fdeb0b"
  license "MIT"
  head "https://github.com/jakeasaurus/lazystatus.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"lazystatus"
  end

  test do
    # Test that the binary was installed correctly
    assert_match "lazystatus v", shell_output("#{bin}/lazystatus --version")
    
    # Test help output
    assert_match "TUI for monitoring status pages", shell_output("#{bin}/lazystatus --help")
  end

  def caveats
    <<~EOS
      🔍 lazystatus is now installed and ready to use!
      
      🚀 Get started:
        lazystatus
      
      💡 For help:
        lazystatus --help
      
      📁 Configuration is stored in:
         ~/.lazystatus/config.json
      
      ➕ Add services with 'a' key in the TUI
      
      🎨 Status colors:
         🟢 Green   - Operational
         🔵 Blue    - Planned Maintenance
         🟡 Yellow  - Degraded Performance
         🔴 Red     - Major Disruption
      
      🎭 Powered by Charm - https://charm.sh
    EOS
  end
end
