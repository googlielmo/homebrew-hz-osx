class HazelcastMember < Formula
  desc "A command line tool for running one or more Hazelcast member instance(s) on the local machine"
  homepage "https://github.com/googlielmo/hazelcast-member"
  url "https://github.com/googlielmo/hazelcast-member/raw/master/archive/hazelcast-member-3.9.2.tar.gz"
  sha256 "d6698986b77dde307b594a420280c8d96bceadde54b2aba7f8df6c3255962a20"
  version "3.9.2"
  revision 7

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
