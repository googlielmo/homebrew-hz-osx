class HazelcastMember < Formula
  desc "A command line tool for running one or more Hazelcast member instance(s) on the local machine"
  homepage "https://github.com/googlielmo/hazelcast-member"
  url "https://github.com/googlielmo/hazelcast-member/raw/master/archive/hazelcast-member-3.9.2.tar.gz"
  sha256 "daa57b4fe54e5b4dccec678ad625d106c844af12089ea6294f87291890b6aae8"
  version "3.9.2"
  revision 5

  depends_on "coreutils"
  depends_on :java => "1.7+"

  bottle :unneeded

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/hazelcast-member"]
    var.mkpath
    inreplace "#{libexec}/bin/utils.sh", "${var}", "#{var}"
    prefix.install_metafiles
  end
end
