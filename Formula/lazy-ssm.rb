class LazySsm < Formula
  desc "On-demand AWS Systems Manager tunnels to servers/databases through EC2 instances"
  homepage "https://github.com/antero-software/lazy-ssm"
  version "v1.0.8"

  on_macos do
    on_arm do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.8/lazy-ssm-darwin-arm64.tar.gz"
      sha256 "b1539c56bd09ef1b3c33cf4043a28405c4b84dfc74ffebfdf20fdccbf0d3be69"
    end
    on_intel do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.8/lazy-ssm-darwin-amd64.tar.gz"
      sha256 "8fe619b9362fd12a3d8ca5c05c65c94fab8cd772fdbe5eb75bfdb422700b9e5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.8/lazy-ssm-linux-arm64.tar.gz"
      sha256 "af8d12245a0e2e76eb11155bfddcbdf2eb891f7be613d7e1adfe8fafc4d5f28b"
    end
    on_intel do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.8/lazy-ssm-linux-amd64.tar.gz"
      sha256 "dd8eba619abb13150c43ef2ae3dd9e211ab89df444f1d57fca290fb15accf13f"
    end
  end

  def install
    bin.install "lazy-ssm"
  end

  service do
    run [opt_bin/"lazy-ssm"]
    keep_alive true
    log_path var/"log/lazy-ssm.log"
    error_log_path var/"log/lazy-ssm.log"
    working_dir var
    environment_variables PATH: "/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
  end

  test do
    system "#{bin}/lazy-ssm", "version"
  end
end
