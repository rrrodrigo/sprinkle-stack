package :munin do
  description 'Munin'

  apt 'munin munin-node'

  verify do
    has_executable 'git'
  end
end

