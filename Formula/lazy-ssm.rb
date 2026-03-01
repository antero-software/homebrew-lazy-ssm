class LazySsm < Formula
  desc "On-demand AWS Systems Manager tunnels to servers/databases through EC2 instances"
  homepage "https://github.com/antero-software/lazy-ssm"
  version "v1.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.3/lazy-ssm-darwin-arm64.tar.gz"
      sha256 "0ecec73a6b2195c48d9a9b5090245e34cd033e5d8e5df5ab893a6c1568e9be4a"
    else
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.3/lazy-ssm-darwin-amd64.tar.gz"
      sha256 "3b1045830c349b5c04e075587ac58a7be185da8c4aef7ed040209488de0a6ee9"
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