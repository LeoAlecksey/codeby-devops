ENV['VAGRANT_SERVER_URL'] = 'https://vagrant.elab.pro'

Vagrant.configure(2) do |config|
    
    config.vm.box = "ubuntu/20.04"
    config.ssh.insert_key = false
  
    config.vm.define "client" do |subconfig|
      subconfig.vm.provider "virtualbox" do |vb|
        vb.name = "client"
      end
      subconfig.vm.hostname = "client"
      subconfig.vm.network "private_network", ip: "192.168.56.42"
      subconfig.vm.provision "add crt", type: "file", source: "./domain.crt", destination: "/home/vagrant/domain.crt"
      subconfig.vm.provision "restart", type: "shell", path: "./script.sh"
      
    end
  
    config.vm.define "server" do |subconfig|
      subconfig.vm.provider "virtualbox" do |vb|
        vb.name = "server"
      end
      subconfig.vm.hostname = "server"
      subconfig.vm.network "private_network", ip: "192.168.56.41"
      subconfig.vm.provision "add html", type: "file", source: "./index.html", destination: "/home/vagrant/index.html"
      subconfig.vm.provision "add crt", type: "file", source: "./domain.crt", destination: "/home/vagrant/domain.crt"
      subconfig.vm.provision "add key", type: "file", source: "./domain.key", destination: "/home/vagrant/domain.key"
      subconfig.vm.provision "add conf", type: "file", source: "./alex.conf", destination: "/home/vagrant/alex.conf"
      subconfig.vm.provision "install Apache", type: "shell", path: "./apache.sh"
     
      
    end
   
  end