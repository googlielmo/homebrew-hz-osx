class HazelcastMember < Formula
  desc "A command line tool for running one or more Hazelcast member instance(s) on the local machine"
  homepage "https://github.com/googlielmo/hazelcast-member"
  url "https://github.com/googlielmo/hazelcast-member/raw/master/archive/hazelcast-member-3.9.2.tar.gz"
  sha256 "dd6209db0e12af1eb4e6cfc2dcdda661d3617e06ff2ca0e2218e3d9bb5e840f8"
  version "3.9.2"
  revision 3

  depends_on "coreutils"
  depends_on :java => "1.7+"

  bottle :unneeded

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/hazelcast-member"]
    var.mkpath
    inreplace "#{libexec}/bin/env.sh", "${var_run}", "#{var}/run"
    inreplace "#{libexec}/bin/start.sh", "${var_run}", "#{var}/run"
    prefix.install_metafiles
  end
end
