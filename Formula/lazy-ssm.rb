class LazySSM < Formula
  desc "On-demand AWS Systems Manager tunnels to servers/databases through EC2 instances"
  homepage "https://github.com/antero-software/lazy-ssm"
  version "v1.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.3/lazy-ssm-darwin-arm64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.3/lazy-ssm-darwin-amd64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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