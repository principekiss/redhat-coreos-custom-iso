Vagrant.configure("2") do |config|
  config.ssh.username = "core"
  config.ssh.insert_key = false
  config.ssh.connect_timeout = 30

  config.vm.provider :virtualbox do |vb|
    vb.check_guest_additions = false
  end

  config.vm.boot_timeout = 600

  config.vm.synced_folder ".", "/vagrant", disabled: true
end