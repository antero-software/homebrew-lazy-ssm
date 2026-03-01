class LazySsm < Formula
  desc "On-demand AWS Systems Manager tunnels to servers/databases through EC2 instances"
  homepage "https://github.com/antero-software/lazy-ssm"
  version "v1.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.6/lazy-ssm-darwin-arm64.tar.gz"
      sha256 "401303b58efb7ce53cec45940fafc179bc555ab9de8795f3779bdd81023e72cf"
    else
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.6/lazy-ssm-darwin-amd64.tar.gz"
      sha256 "909eaa0403bd3190ede000200cd3f48d9847bbbf2d433bd8626ffaf120aafed1"
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
              environment_variables PATH: std_service_path_env
  end

  test do
    system "#{bin}/lazy-ssm", "version"
  end
end