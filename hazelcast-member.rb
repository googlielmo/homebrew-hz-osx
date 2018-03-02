class HazelcastMember < Formula
  desc "A command line tool for running one or more Hazelcast member instance(s) on the local machine"
  homepage "https://github.com/googlielmo/hazelcast-member"
  url "https://github.com/googlielmo/hazelcast-member/raw/master/archive/hazelcast-member-3.9.2.tar.gz"
  sha256 "17f5ca508976dced1c6cbca08b0552c5ebde19597b9c85ec2c6450105b4d6bae"
  version "3.9.2"
  revision 4

  depends_on "coreutils"
  depends_on :java => "1.7+"

  bottle :unneeded

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/hazelcast-member"]
    var.mkpath
    inreplace "#{libexec}/bin/pid-utils.sh", "${var_run}", "#{var}/run"
    inreplace "#{libexec}/bin/start.sh", "${var_run}", "#{var}/run"
    prefix.install_metafiles
  end
end
