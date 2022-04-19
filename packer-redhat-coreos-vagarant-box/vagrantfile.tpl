Vagrant.configure("2") do |config|
  config.ssh.username = "core"
  config.ssh.insert_key = false
  private_key_path = File.expand_path('~/.vagrant.d/insecure_private_key')

  config.vm.provider :virtualbox do |vb|
    vb.check_guest_additions = false
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true
end