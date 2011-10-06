package :video do
  description "Video"

  requires :video_packages, :libvpx, :ffmpeg, :ffmpeg2theora
end

package :video_packages do
  description "Video: apt packages"

  apt "libdirac-dev libfaac-dev libfaad-dev  libgpac-dev libgsm1-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libopenjpeg-dev libschroedinger-dev libsdl1.2-dev libspeex-dev libtheora-dev libvorbis-dev libxvidcore4-dev texi2html yasm libavdevice52 libavformat52 libavutil49 libdc1394-22 libfaad0 libgif4 libgsm1 libid3tag0 libimlib2 libogg0 libpostproc51 libraw1394-8  libsdl1.2debian libsdl1.2debian-alsa libsvga1 libswscale0 libtheora0 libvorbis0a libvorbisenc2 libx86-1 svgalibg1 libavcodec52 libavcore0 libavdevice52 libavfilter1   libavformat52 libavutil49 libavutil50 libdc1394-22 libjack-jackd2-0 libpostproc51 librtmp0 libswscale0 libva-x11-1   libva1 libvpx0 libx264-112 libavcodec-dev libavdevice-dev libavformat-dev libpostproc-dev libswscale-dev scons"
end

package :libvpx do
  description "Video: libvpx"
  source "http://webm.googlecode.com/files/libvpx-v0.9.7-p1.tar.bz2" do
    custom_install './configure --extra-cflags="-fPIC" ; make ; make install'
  end
end

package :ffmepg do
  description "Video: FFmpeg"

  source "http://www.ffmpeg.org/releases/ffmpeg-0.8.5.tar.gz" do
    enable %w( gpl postproc swscale avfilter libmp3lame libvorbis libtheora libdirac libschroedinger libfaac libxvid libx264 libvpx libspeex nonfree shared pthreads pic )
    disable %w( indevs )
  end
  requires :libvpx, :video_packages
end


package :ffmepg2theora do
  description "Video: FFmpeg2theora"

  source "http://v2v.cc/~j/ffmpeg2theora/downloads/ffmpeg2theora-0.28.tar.bz2" do
    custom_install "scons install prefix=/usr"
  end
  requires :video_packages
end
