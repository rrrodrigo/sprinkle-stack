
package :passenger, :provides => :appserver do
  description 'Phusion Passenger'
  version '3.0.9'
  requires :ruby

  binaries = %w[passenger-config passenger-install-nginx-module passenger-install-apache2-module passenger-make-enterprisey passenger-memory-stats passenger-spawn-server passenger-status]

  gem 'passenger', :version => version

  verify do
    has_gem 'passenger', version

    binaries.each do |bin|
      has_executable bin
    end
  end
end
