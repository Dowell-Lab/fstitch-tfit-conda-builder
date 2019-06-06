Vagrant.configure("2") do |config|
  config.vm.box = "continuumio/anaconda3"
  config.vm.post_up_message = "Conda Builder VM"
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
  end
  config.vm.synced_folder "./packages", "/to_build"
end
