class HazelcastMember < Formula
  desc "A command line tool for running one or more Hazelcast member instance(s) on the local machine"
  homepage "https://github.com/googlielmo/hazelcast-member"
  version "3.9.3"
  revision 1
  url "https://github.com/googlielmo/hazelcast-member/raw/master/archive/hazelcast-member-#{version}_#{revision}.tar.gz"
  sha256 "88cf19ba778d32ab5d2859b89a49fd6e45f7a9c301b759a2ffa1419220026bc5"

  depends_on "coreutils"
  depends_on :java => "1.7+"

  bottle :unneeded

  def install
    mkpath "#{etc}/hazelcast"
    libexec.install Dir["*"]
    etc.install_symlink "#{libexec}/etc/hazelcast.xml" => "hazelcast/hazelcast.xml"
    bin.install_symlink Dir["#{libexec}/bin/hazelcast-member"]
    var.mkpath
    inreplace "#{libexec}/bin/utils.sh", "${var}", "#{var}"
    inreplace "#{libexec}/bin/utils.sh", "${etc}", "#{etc}"
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
