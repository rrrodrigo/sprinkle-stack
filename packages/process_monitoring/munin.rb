package :munin do
  description 'Munin'
  requires :munin_core, :munin_config

end

package :munin_core
  description "Munin: Core"
  apt 'munin munin-node'

  verify do
    has_directory '/etc/munin'
  end
end

package :munin_config
  description "Munin: Config"
  requires :munin_core

  %w[munin munin-node].each do |config_name|
    config_file = "/etc/munin/#{config_name}.conf"
    config_template = File.join(File.dirname(__FILE__), 'munin', "#{config_name}.conf")

    transfer config_template, config_file, :render => true do
      # Ensure path exists.
      pre :install, "mkdir -p #{File.dirname(config_file)}"

      # Set proper permissions.
      post :install, "chmod 0644 #{config_file}"
    end

    verify do
      has_file config_file
      file_contains config_file, `head -n 1 #{config_template}`
    end
  end
end
