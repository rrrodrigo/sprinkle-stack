
package :tools, :provides => :tools do
  description "Tools: Common tools needed by applications or for operations"

  requires :build_essential, :ntp, :screen, :curl, :vim, :htop,
            :imagemagick, :rsync, :debconf_utils, :iftop, :apache_utils,
            :emacs, :mtr, :mc, :sysv_rc_conf
end

package :build_essential do
  description 'build_essential'

  apt 'build-essential' do
    post :install, 'apt-get update && apt-get -y upgrade'
  end

  verify do
    has_apt 'build-essential'
  end
end

package :debconf_utils do
  description 'debconf-utils'

  apt 'debconf-utils'

  verify do
    has_executable 'debconf-get-selections'
  end
end

package :ntp do
  description 'ntp'

  apt 'ntp' do
    post :install, 'ntpdate pool.ntp.org'
  end

  verify do
    has_executable 'ntpdate'
  end
end

package :screen do
  description 'screen'

  apt 'screen'

  verify do
    has_executable 'screen'
  end
end

package :curl do
  description 'curl'

  apt 'curl'

  verify do
    has_executable 'curl'
  end
end

package :vim do
  description 'vim'

  apt 'vim'

  verify do
    has_executable 'vim'
  end
end

package :htop do
  description 'htop'

  apt 'htop'

  verify do
    has_executable 'htop'
  end
end

package :imagemagick do
  description 'imagemagick'

  apt 'imagemagick'

  verify do
    has_executable '/usr/bin/convert'
  end
end

package :rsync do
  description 'rsync'

  apt 'rsync'

  verify do
    has_executable 'rsync'
  end
end

package :iftop do
  description 'iftop'

  apt 'iftop'

  verify do
    has_executable 'iftop'
  end
end

package :apache_utils do
  description 'apache utils'

  apt 'apache2-utils'

  verify do
    has_executable 'htpasswd'
  end
end

package :emacs do
  description 'emacs'

  apt 'emacs23-nox'

  verify do
    has_executable 'emacs'
  end
end

package :mtr do
  description 'mtr'

  apt 'mtr-tiny bind9-host'

  verify do
    has_executable 'mtr'
    has_executable 'host'
  end
end

package :mc do
  description 'mc'

  apt 'mc'

  verify do
    has_executable 'mc'
  end
end

package :sysv_rc_conf do
  description 'sysv-rc-conf'

  apt 'sysv-rc-conf'

  verify do
    has_executable 'sysv-rc-conf'
  end
end

