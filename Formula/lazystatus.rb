class Lazystatus < Formula
  desc "🔍 A modern TUI for monitoring status pages"
  homepage "https://github.com/jakeasaurus/lazystatus"
  url "https://github.com/jakeasaurus/lazystatus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2201f5248d03a4488461f31c0cfeb6f11e8180564e8928609bfda4ac62b732df"
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
