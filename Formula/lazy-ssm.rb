class LazySsm < Formula
  desc "On-demand AWS Systems Manager tunnels to servers/databases through EC2 instances"
  homepage "https://github.com/antero-software/lazy-ssm"
  version "v1.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.5/lazy-ssm-darwin-arm64.tar.gz"
      sha256 "f0555dff9a95f351bb36fd97c2fafd5cf65bb842196d2ab2573260d2aacd2625"
    else
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.5/lazy-ssm-darwin-amd64.tar.gz"
      sha256 "53240cc93dfe76ee41590ae65ced3dd76e6e3110e1d80d32ffec2cc9a53a4703"
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