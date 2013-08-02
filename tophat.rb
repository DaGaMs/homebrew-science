require 'formula'

class Tophat < Formula
  homepage 'http://tophat.cbcb.umd.edu/'
  url 'http://tophat.cbcb.umd.edu/downloads/tophat-2.0.9.tar.gz'
  sha1 '6ca77ae70caf44cf78adca240987300baa72b3c5'

  depends_on 'samtools'
  depends_on 'boost'

  def install
    # This can only build serially, otherwise it errors with no make target.
    ENV.deparallelize

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "#{bin}/tophat", "--version"
  end
end
