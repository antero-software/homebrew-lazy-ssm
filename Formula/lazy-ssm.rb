class LazySsm < Formula
  desc "On-demand AWS Systems Manager tunnels to servers/databases through EC2 instances"
  homepage "https://github.com/antero-software/lazy-ssm"
  version "v1.0.6"

  on_macos do
    on_arm do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.6/lazy-ssm-darwin-arm64.tar.gz"
      sha256 "401303b58efb7ce53cec45940fafc179bc555ab9de8795f3779bdd81023e72cf"
    end
    on_intel do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.6/lazy-ssm-darwin-amd64.tar.gz"
      sha256 "909eaa0403bd3190ede000200cd3f48d9847bbbf2d433bd8626ffaf120aafed1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.6/lazy-ssm-linux-arm64.tar.gz"
      sha256 "2d9811ca37f00c34c2b63dc825b290422f09c49df94265374b7b9f21b6c6219f"
    end
    on_intel do
      url "https://github.com/antero-software/lazy-ssm/releases/download/v1.0.6/lazy-ssm-linux-amd64.tar.gz"
      sha256 "5a8f2b772ec37e9bcf27ffb49b45e77eff8c159741024c006abfdd09a12dbd29"
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
