class LazySsm < Formula
  desc "On-demand AWS Systems Manager tunnels to servers/databases through EC2 instances"
  homepage "https://github.com/antero-software/lazy-ssm"
  version "v1.0.7"

  on_macos do
    on_arm do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.7/lazy-ssm-darwin-arm64.tar.gz"
      sha256 "b7a3e557b298d46de7f7372e74950ced3501fc32466f24f9b50408e4de5f0d98"
    end
    on_intel do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.7/lazy-ssm-darwin-amd64.tar.gz"
      sha256 "7f7636ff1f792464c1317a402b040b8ff392bf1688f633cea60a2d948def0304"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.7/lazy-ssm-linux-arm64.tar.gz"
      sha256 "e0cb7e297afe1a56aa1aef3c35308d53628f410f696ed2182f77375e8d0027c6"
    end
    on_intel do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.7/lazy-ssm-linux-amd64.tar.gz"
      sha256 "1eca53addc3bf25cef230cf0153f20382bd1885da7d8cba0cc354a1e4f25755d"
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
