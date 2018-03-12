class HazelcastMember < Formula
  desc "A command line tool for running one or more Hazelcast member instance(s) on the local machine"
  homepage "https://github.com/googlielmo/hazelcast-member"
  url "https://github.com/googlielmo/hazelcast-member/raw/master/archive/hazelcast-member-3.9.2.tar.gz"
  sha256 "97d3fba0cb322bf21bf3cb1356db4a68b1f4b9974f7987dd066353a8a2bce3f2"
  version "3.9.2"
  revision 8

  depends_on "coreutils"
  depends_on :java => "1.7+"

  bottle :unneeded

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/hazelcast-member"]
    var.mkpath
    inreplace "#{libexec}/bin/utils.sh", "${var}", "#{var}"
    prefix.install_metafiles
    bash_completion.install "#{libexec}/bin/hazelcast-member-completion.sh" => "hazelcast-member"
  end

  def caveats
    <<-EOS
To enable tab completion add to your profile:
  if which hazelcast-member > /dev/null; then eval "$(hazelcast-member init -)"; fi
    EOS
  end
end
