class LazySsm < Formula
  desc "On-demand AWS Systems Manager tunnels to servers/databases through EC2 instances"
  homepage "https://github.com/antero-software/lazy-ssm"
  version "v1.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.4/lazy-ssm-darwin-arm64.tar.gz"
      sha256 "e3105e74f89f939146e4842c23407758863d134a6a5c7b84407c4743597ae3c9"
    else
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.4/lazy-ssm-darwin-amd64.tar.gz"
      sha256 "f843d343f4e91ba5cd2a495c6eab69a980670d885232c2409abbf0dd3a6bf8e1"
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
  end

  test do
    system "#{bin}/lazy-ssm", "version"
  end
end