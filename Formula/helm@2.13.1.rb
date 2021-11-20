class HelmAT2131 < Formula
  desc "The Kubernetes package manager"
  homepage "https://helm.sh/"
  version "2.13.1"
  url "https://get.helm.sh/helm-v2.13.1-darwin-amd64.tar.gz"
  sha256 "c9564c4133349b98a8c1dda42fdb6545f6e4bfdf0980cdfc38cf76d2f8e5e701"

  def install
    bin.install "helm"
    bin.install "tiller"

    output = Utils.popen_read("SHELL=bash #{bin}/helm completion bash")
    (bash_completion/"helm").write output

    output = Utils.popen_read("SHELL=zsh #{bin}/helm completion zsh")
    (zsh_completion/"_helm").write output
  end

  test do
    system "#{bin}/helm", "create", "foo"
    assert File.directory? "#{testpath}/foo/charts"

    version_output = shell_output("#{bin}/helm version --client 2>&1")
    assert_match "GitTreeState:\"clean\"", version_output
    if build.stable?
      assert_match stable.instance_variable_get(:@resource).instance_variable_get(:@specs)[:revision], version_output
    end
  end
end
