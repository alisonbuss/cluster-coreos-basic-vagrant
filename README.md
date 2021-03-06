
#### Translation for: **[English](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/blob/master/README_LANG_EN.md)**.

#### Status do Projeto: *(Finalizado)*.

<h1 align="center">
    Subir um cluster CoreOS de 3 hosts, usando <br/ >"Packer e Vagrant"
</h1>

<h2 align="center">
    <img src="https://github.com/alisonbuss/cluster-coreos-basic-vagrant/raw/master/files/print-vagrant-cluster.png" alt="print-vagrant"/>
</h2>

### Inspirado nos projetos:
 
* **[[coreos-vagrant](https://github.com/coreos/coreos-vagrant/)]** - Do repositório oficial do CoreOS.
* **[[coreos-kids-vagrant](https://github.com/alisonbuss/coreos-kids-vagrant/)]** - Exemplo de um Vagrantfile subindo varias VM CoreOS sobre uma configuração simples
* **[[coreos-packer](https://github.com/alisonbuss/coreos-packer/)]** - Projeto de criação de imagens CoreOS para múltiplas plataformas (Amazon EC2, Google GCE, DigitalOcean, VirtualBox).

### Dependência de ferramentas:

* **[[VirtualBox](https://www.virtualbox.org/)]** 4.3.10 ou superior...
* **[[Vagrant](https://www.vagrantup.com/)]** 1.6.3 ou superior...
* **[[Packer](https://www.packer.io/)]** 1.1.3 ou superior...
* **[[Container Linux Config Transpiler](https://github.com/coreos/container-linux-config-transpiler)]** 0.5.0 ou superior...
* **[[GNU Make](https://www.gnu.org/software/make/)]** 4.1 ou superior...

> **:warning: Nota:**
> - *É necessário ter instalado as dependências citadas acima, para que o projeto funcione.*
> - *A execução desse projeto foi feita através de um **Desktop Ubuntu 17.10 (Artful Aardvark)**.*
>

### Dependência de projetos:

* **[[coreos-packer](https://github.com/alisonbuss/coreos-packer/)]** Esse projeto é responsável por criar imagens para múltiplas plataformas e na subsequencia gera um "**[Vagrant Box](https://www.vagrantup.com/docs/boxes/base.html)**".

> **:warning: Nota:**
> *Para subir um cluster pelo Vagrant, vai ser utilizado um "**[Vagrant Box](https://www.vagrantup.com/docs/boxes/base.html)**" gerado pelo projeto citado acima "**[coreos-packer](https://github.com/alisonbuss/coreos-packer/)**".*

### Documentação de apoio:

* **[Post: Yet Emerging Technologies - Blog, by Sébastien Braun "CoreOS Container Linux"](http://www.yet.org/2017/03/01-container-linux/)**.
* **[Documentação oficial do CoreOS](https://coreos.com/os/docs/latest/cluster-architectures.html)**.
* **[Documentação oficial do Etcd](https://coreos.com/etcd/docs/latest/op-guide/clustering.html)**
* **[Documentação oficial do Packer](https://www.packer.io/docs/index.html)**.
* **[Documentação oficial do Vagrant](https://www.vagrantup.com/docs/index.html)**.
* **[Documentação da criação de imagem "CoreOS Packer"](https://github.com/alisonbuss/coreos-packer/blob/master/README.md)**.

### Objetivo:

Fornecer um projeto de "Infrastructure as Code (IaC)" usando **Vagrantfile** e **shell scripts** para provisionar um **cluster CoreOS** básico, baseado em uma imagem "**[coreos-packer](https://github.com/alisonbuss/coreos-packer/)**".

Com um ambiente de **3 hosts virtuais**, em cada host provisionado, será executado os serviços: **(Docker, Rkt, Etcd-2, Etcd-3, Flannel)** e garantir que o **(Etcd-Server)** de cada host se comuniquem entre si, formando assim um cluster simples e funcional.

O ambiente será semelhante a proposta da documentação oficial do CoreOS citada abaixo:

  - Executando CoreOS Container Linux em Vagrant :point_right: https://coreos.com/os/docs/latest/booting-on-vagrant.html
  - Uma série de exemplos, mostra os procedimentos básicos para trabalhar com um cluster Etcd :point_right: https://coreos.com/etcd/docs/latest/demo.html
  - Guia de Clusterização Etcd :point_right: https://coreos.com/etcd/docs/latest/op-guide/clustering.html

### Ambiente Proposto:

### Imagem: 

  - [CoreOS Stable 1632.3.0](https://github.com/alisonbuss/coreos-packer/)
    - kernel: v4.14.19
    - systemd: v235
    - ignition: v0.20.1
    - rkt: v1.29.0
    - docker: v17.09.1
    - docker-compose: v1.19.0
    - etcd v2.3.8
    - etcd v3.2.11
    - flannel v0.9.1
    - active-python: v2.7.13

### Host: 

Para cada **host** será fornecido alguns dados específicos:

  - 1ª Host:
    - Hostname: coreos-1
    - Domain: coreos-1.dev.com
    - Private IP: 192.168.33.101
    - Interface: enp0s8
    - Etcd Server: coreos-1-etcd
  - 2ª Host:
    - Hostname: coreos-2
    - Domain: coreos-2.dev.com
    - Private IP: 192.168.33.102
    - Interface: enp0s8
    - Etcd Server: coreos-2-etcd
  - 3ª Host:
    - Hostname: coreos-3
    - Domain: coreos-3.dev.com
    - Private IP: 192.168.33.103
    - Interface: enp0s8
    - Etcd Server: coreos-3-etcd

O provisionamento de cada **host** será através dos arquivos de **Shell Script**:

    ./provision/shell-script/config-init.sh
    ./provision/shell-script/config-network.sh
    ./provision/shell-script/config-storage-unit.sh
    ./provision/shell-script/config-rkt.sh
    ./provision/shell-script/config-docker.sh
    ./provision/shell-script/config-etcd.sh
    ./provision/shell-script/config-flannel.sh
    ./provision/shell-script/config-security.sh

> **:warning: Nota:**
>
> *Para cada cluster criado pelo Vagrant, será gerado automaticamente um **token de descoberta para Etcd** pelo **[Vagrantfile](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/blob/master/Vagrantfile)** na **[linha 15](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/blob/master/Vagrantfile#L15)**.*
>
> *Para mais detalhes sobre **token de descoberta para Etcd** nos links abaixo:*
> - *[Descoberta para cluster CoreOS](https://coreos.com/os/docs/latest/cluster-discovery.html)*
> - *[Guia de clusterização ETCD, Token de Descoberta](https://coreos.com/etcd/docs/latest/op-guide/clustering.html#discovery)*


### Diagrama:

<h1 align="center">
    <img src="https://github.com/alisonbuss/cluster-coreos-basic-vagrant/raw/master/files/diagram-environment.png" alt="diagrama"/>
</h1>

### Estrutura do Projeto:

Descrição dos arquivos e diretorios do projeto:

```text
cluster-coreos-basic-vagrant.........Pasta do projeto.
├── files............................Arquivos de apoio a documentação.
│   ├── diagram-environment.png
│   ├── print-coreos-packer.png
│   ├── print-vagrant-cluster.png
│   ├── print-vagrant-up-end.png
│   └── print-vagrant-up.png
├── LICENSE..........................Licença (MIT).
├── provision........................Pasta onde-se encontra os arquivos de provisionamento.
│   └── shell-script.................Pasta de provisionamento em shell script.
│       ├── config-docker.sh.........Configurar e habilitar o serviço Docker.
│       ├── config-etcd.sh...........Configurar e habilitar o serviço Etcd.
│       ├── config-flannel.sh........Configurar e habilitar o serviço Flannel.
│       ├── config-init.sh...........Configurações iniciais do host.
│       ├── config-network.sh........Configurações de rede.
│       ├── config-rkt.sh............Configurar e habilitar o serviço de contêiner Rkt.
│       ├── config-security.sh.......Configurações de segurança.
│       └── config-storage-unit.sh...Configurações de unidade de armazenamentos.
├── README_LANG_EN.md................Arquivo de tradução do README.md
├── README.md........................Arquivo de documentação do projeto.
└── Vagrantfile......................Arquivo principal para provisionar um cluster pelo vagrant.
```

Arquivo principal do projeto **[Vagrantfile](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/blob/master/Vagrantfile)**.

```ruby
# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Determine the number of instances of the cluster.
INSTANCES = 3

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.6.0"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 
    # Generating the "discovery token" of cluster ----------------------------------------
    $DISCOVERY = "The discovery token will be automatically generated."
    if ARGV[0].eql?('up') || ARGV[0].eql?('reload')
        require "open-uri"
        $DISCOVERY = open("https://discovery.etcd.io/new?size=#{INSTANCES}").read
        puts "RUN: automatically replace the discovery token on 'vagrant up' or 'vagrant reload'"
        puts "==> generate a new discovery token for cluster, example: 'https://discovery.etcd.io/new?size=#{INSTANCES}'"
        puts "==> discovery token: '#{$DISCOVERY}'"
    end
    # Initiating virtual cluster configuration -------------------------------------------
    (1..INSTANCES).each do |i|
        # define host name and domain ----------------------------------------------------
        _hostname = "coreos-#{i}"
        _domain   = "#{_hostname}.dev.com"
        # define default values ----------------------------------------------------------
        _private_ip = "192.168.33.10#{i}"
        # starting the configuration of the virtual machine ------------------------------
        config.vm.define _domain do |subconfig|
            # define host name -----------------------------------------------------------
            subconfig.vm.hostname = _hostname
            # define the box generated by https://github.com/alisonbuss/coreos-packer ----
            subconfig.vm.box = "packer/coreos-vagrant-box"
            # define access --------------------------------------------------------------
            # This sets the username that Vagrant will SSH as by default.
            # --> default: (config.ssh.username = "vagrant") 
            # --> default: (config.ssh.password = "vagrant") 
            # Always use Vagrants insecure key.
            subconfig.ssh.insert_key = false
            # Forward ssh agent to easily ssh into the different machines.
            subconfig.ssh.forward_agent = true   
            # provider virtualbox --------------------------------------------------------
            subconfig.vm.provider "virtualbox" do |virtualbox|
                virtualbox.name = "vm-" + _hostname
                virtualbox.cpus = 2
                virtualbox.memory = 1024
                virtualbox.gui = false
                virtualbox.functional_vboxsf = false
                virtualbox.check_guest_additions = false
                virtualbox.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
            end
            # provider network -----------------------------------------------------------
            subconfig.vm.network "private_network", ip: "#{_private_ip}", auto_config: false
            # Enable port forwarding from guest(s) to host machine, auto correction is enabled by default.
            subconfig.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
            # Enable port forwarding of Docker TCP socket
            # Set to the TCP port you want exposed on the *host* machine, default is 2375
            # If 2375 is used, Vagrant will auto-increment (e.g. in the case of INSTANCES > 1)
            # You can then use the docker tool locally by setting the following env var:
            #   export DOCKER_HOST='tcp://127.0.0.1:2375'
            subconfig.vm.network "forwarded_port", guest: 2375, host: (2374 + i), auto_correct: true, host_ip: "127.0.0.1"
            # provider base system -------------------------------------------------------
            subconfig.vm.provision "shell", path: "provision/shell-script/config-init.sh", args:["#{_hostname}"]
            subconfig.vm.provision "shell", path: "provision/shell-script/config-network.sh", args:["#{_private_ip}"]
            subconfig.vm.provision "shell", path: "provision/shell-script/config-storage-unit.sh"
            subconfig.vm.provision "shell", path: "provision/shell-script/config-rkt.sh"
            subconfig.vm.provision "shell", path: "provision/shell-script/config-docker.sh"
            subconfig.vm.provision "shell", path: "provision/shell-script/config-etcd.sh", args:["#{_private_ip}","#{$DISCOVERY}","#{_hostname}-etcd"]
            subconfig.vm.provision "shell", path: "provision/shell-script/config-flannel.sh"
            subconfig.vm.provision "shell", path: "provision/shell-script/config-security.sh"
            # restarting the system ------------------------------------------------------
            subconfig.vm.provision "shell", inline: "echo 'Restarting the system in 7 seconds...'; (sleep 7s; reboot;) &"
        end
    end
    # plugin conflict
    if Vagrant.has_plugin?("vagrant-vbguest") then
        config.vbguest.auto_update = false
    end
end
```

### Executando o projeto.

> **:warning: Nota:**
> - *A execução desse projeto foi feita através de um **Desktop Ubuntu 17.10 (Artful Aardvark)**.*
> - *Suponho que você já tenha instalados as [dependências do projeto](https://github.com/alisonbuss/cluster-coreos-basic-vagrant#depend%C3%AAncia-de-ferramentas) citada acima.*

Antes de sair executado o projeto pelo terminal, precisamos validar algumas dependências já instaladas no seu **desktop**, para poder assim executar o projeto.

### Validando as dependências:

  * **[[VirtualBox](https://www.virtualbox.org/)]** 4.3.10 ou superior...
    * Testar pelo terminal:
      ```bash
      $ VBoxManage -v
      ```
    * Resultado semelhante:
      ```bash
      5.2.8r121009
      ```
  * **[[Vagrant](https://www.vagrantup.com/)]** 1.6.3 ou superior...
    * Testar pelo terminal:
      ```bash
      $ vagrant -v
      ```
    * Resultado semelhante:
      ```bash
      Vagrant 2.0.1
      ```
  * **[[Packer](https://www.packer.io/)]** 1.1.3 ou superior...
    * Testar pelo terminal:
      ```bash
      $ packer -v
      ```
    * Resultado semelhante:
      ```bash
      1.1.3
      ```
  * **[[Container Linux Config Transpiler](https://github.com/coreos/container-linux-config-transpiler)]** 0.5.0 ou superior...
    * Testar pelo terminal:
      ```bash
      $ ct -version
      ```
    * Resultado semelhante:
      ```bash
      ct v0.5.0
      ```
  * **[[GNU Make](https://www.gnu.org/software/make/)]** 4.1 ou superior...
    * Testar pelo terminal:
      ```bash
      $ make -v
      ```
    * Resultado semelhante:
      ```bash
      GNU Make 4.1
      Compilado para x86_64-pc-linux-gnu
      Copyright (C) 1988-2014 Free Software Foundation, Inc.
      ...
      ```

PRONTO!!! se tudo funcionou como o esperado agora podemos executar o projeto [coreos-packer](https://github.com/alisonbuss/coreos-packer/) e o [cluster-coreos-basic-vagrant](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/).

> **:warning: Nota:**
> - *Caso ocorra **ERROS** nas validações acima, **Boa Sorte!!!  "O Google é o seu pastor e nada te faltará..."***


### Executando o projeto "[coreos-packer](https://github.com/alisonbuss/coreos-packer/)" usando a ferramenta Packer.

1ª) Vamos criar uma pasta que vai ser o nosso ambiente e fazer o download do projeto **[coreos-packer](https://github.com/alisonbuss/coreos-packer/archive/master.zip)** via terminal:

```bash
$ mkdir -p "my-project-IaC"
$ cd ./my-project-IaC

$ wget -O "coreos-packer.zip" "https://github.com/alisonbuss/coreos-packer/archive/master.zip"

$ ls
coreos-packer.zip
```

2ª) Vamos descompactar o projeto **coreos-packer**, entrar na pasta e exibir o plano de execução:

```bash
$ unzip "coreos-packer.zip"

$ clear
$ ls
coreos-packer-master  coreos-packer.zip

$ cd ./coreos-packer-master
$ ls
build-image.sh  Makefile       packer-templates  pre-provision  README_LANG_EN.md
LICENSE         Makefile.test  packer-variables  README_DOC.md  

$ make plan
The default values to be used by this Makefile:

    --> MAKECMDGOALS: make plan
    --> WORKING_DIRECTORY: .

    --> PACKER_TEMPLATE: coreos-virtualbox-template.json
    --> PACKER_VARIABLES: [global.json /operational-system/coreos.json /platform/virtualbox.json custom.json]
    --> PACKER_ONLY: virtualbox-iso
    --> PACKER_TEMPLATES_PATH: ./packer-templates
    --> PACKER_VARIABLES_PATH: ./packer-variables

    --> IGNITION_SOURCE_FILE: ./pre-provision/container-linux-config/keys-to-underworld.yml
    --> IGNITION_COMPILATION_PATH: ./pre-provision/ignitions
    --> IGNITION_PLATFORMS: vagrant-virtualbox digitalocean ec2 gce

    --> VAGRANT_BOX_NAME: packer/coreos-vagrant-box
    --> VAGRANT_BOX_PATH: ./builds/image-coreos-vagrant.box

    --> BUILD_IMAGE_CMD: ./build-image.sh
```

3ª) Pronto agora vamos executar o projeto **coreos-packer** e gerar uma imagem **"Vagrant Box"**:

```bash
$ ls
build-image.sh  Makefile       packer-templates  pre-provision  README_LANG_EN.md
LICENSE         Makefile.test  packer-variables  README_DOC.md  

$ make plan compile validate build install-box
...
```

PRONTO!!! só isso para gerar uma imagem personalizado do CoreOS para um **"Vagrant Box"**

Resultado semelhante abaixo:
<img alt="print-packer" src="https://github.com/alisonbuss/cluster-coreos-basic-vagrant/raw/master/files/print-coreos-packer.png"/>


4ª) Pronto agora vamos voltar para o raiz do ambiente: **"my-project-IaC"** e executar a próxima etapa do projeto **[cluster-coreos-basic-vagrant](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/)**:

```bash
$ cd ../
$ ls
coreos-packer-master  coreos-packer.zip
```

### Executando o projeto "[cluster-coreos-basic-vagrant](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/)" usando a ferramenta Vagrant.

**Pronto!!!** agora é a parte onde executamos e subimos o cluster de 3 hosts:

1ª) Vamos fazer o download do projeto **[cluster-coreos-basic-vagrant](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/archive/master.zip)** via terminal:

```bash
$ wget -O "cluster-coreos-basic-vagrant.zip" "https://github.com/alisonbuss/cluster-coreos-basic-vagrant/archive/master.zip"

$ ls
cluster-coreos-basic-vagrant.zip  coreos-packer-master  coreos-packer.zip

```

2ª) Vamos descompactar o projeto **cluster-coreos-basic-vagrant**, entrar na pasta:

```bash
$ unzip "cluster-coreos-basic-vagrant.zip"

$ clear
$ ls
cluster-coreos-basic-vagrant-master  coreos-packer-master
cluster-coreos-basic-vagrant.zip     coreos-packer.zip

$ cd ./cluster-coreos-basic-vagrant-master
$ ls
files  LICENSE  provision  README_LANG_EN.md  README.md  Vagrantfile
```

3ª) Vamos exibir a lista de **"Vagrant Box"** instalados e o "status" através dos [comandos CLI do Vagrant](https://www.vagrantup.com/docs/cli/):

```bash
$ vagrant box list
packer/coreos-vagrant-box (virtualbox, 0)
```

```bash
$ vagrant status
Current machine states:

coreos-1.dev.com          not created (virtualbox)
coreos-2.dev.com          not created (virtualbox)
coreos-3.dev.com          not created (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

Se o resultado for semelhante ao comandos acima o projeto **cluster-coreos-basic-vagrant** está pronto para ser executado.

4ª) Agora vamos subir um cluster de 3 hosts pelo CLI do Vagrant:

```bash
$ vagrant up
RUN: automatically replace the discovery token on 'vagrant up' or 'vagrant reload'
==> generate a new discovery token for cluster, example: 'https://discovery.etcd.io/new?size=3'
==> discovery token: 'https://discovery.etcd.io/ebfc14707f1fca97889261c9d15fa61d'
Bringing machine 'coreos-1.dev.com' up with 'virtualbox' provider...
Bringing machine 'coreos-2.dev.com' up with 'virtualbox' provider...
Bringing machine 'coreos-3.dev.com' up with 'virtualbox' provider...
==> coreos-1.dev.com: Importing base box 'packer/coreos-vagrant-box'...
...
```

Resultado semelhante a imagem abaixo:
<p align="center">
    <img src="https://github.com/alisonbuss/cluster-coreos-basic-vagrant/raw/master/files/print-vagrant-up.png" alt="print-vagrant"/>
</p>

5ª) Vamos acessar o host 1 e validar se cada host está se comuniquem entre si, formando assim um cluster funcional:

```bash
$ vagrant ssh coreos-1.dev.com
...

$ etcdctl cluster-health
member 6639bf9141f6845c is healthy: got healthy result from http://192.168.33.103:2379
member 6b67bcbe3fdc1041 is healthy: got healthy result from http://192.168.33.102:2379
member a37b107bde800cac is healthy: got healthy result from http://192.168.33.101:2379
cluster is healthy

$ etcdctl member list
6639bf9141f6845c: name=coreos-3-etcd peerURLs=http://192.168.33.103:2380 clientURLs=http://192.168.33.103:2379 isLeader=false
6b67bcbe3fdc1041: name=coreos-2-etcd peerURLs=http://192.168.33.102:2380 clientURLs=http://192.168.33.102:2379 isLeader=true
a37b107bde800cac: name=coreos-1-etcd peerURLs=http://192.168.33.101:2380 clientURLs=http://192.168.33.101:2379 isLeader=false

$ etcdctl set key01 Gibimba
Gibimba

$ ETCDCTL_API=3 etcdctl put key01 Gibimba-Etcd-3
OK

$ etcd2 --version
etcd Version: 2.3.8
Git SHA: 7e4fc7e
Go Version: go1.7.6
Go OS/Arch: linux/amd64

$ curl -L http://127.0.0.1:2379/version
{"etcdserver":"3.2.11","etcdcluster":"3.2.0"}
```

6ª) Vamos acessar o host 3 e validar se cada host está se comuniquem entre si, com o Etcd-3:

```bash
$ vagrant ssh coreos-3.dev.com
...

$ etcdctl get key01
Gibimba

$ ETCDCTL_API=3 etcdctl get key01
key01
Gibimba-Etcd-3

$ ETCDCTL_API=3 etcdctl member list
6639bf9141f6845c, started, coreos-3-etcd, http://192.168.33.103:2380, http://192.168.33.103:2379
6b67bcbe3fdc1041, started, coreos-2-etcd, http://192.168.33.102:2380, http://192.168.33.102:2379
a37b107bde800cac, started, coreos-1-etcd, http://192.168.33.101:2380, http://192.168.33.101:2379

$ ETCDCTL_API=3 etcdctl --endpoints=http://192.168.33.101:2379,http://192.168.33.102:2379,http://192.168.33.103:2379 --write-out=table endpoint status
+----------------------------+------------------+---------+---------+-----------+-----------+------------+
|          ENDPOINT          |        ID        | VERSION | DB SIZE | IS LEADER | RAFT TERM | RAFT INDEX |
+----------------------------+------------------+---------+---------+-----------+-----------+------------+
| http://192.168.33.101:2379 | a37b107bde800cac |  3.2.11 |   25 kB |     false |         2 |       1266 |
| http://192.168.33.102:2379 | 6b67bcbe3fdc1041 |  3.2.11 |   25 kB |      true |         2 |       1266 |
| http://192.168.33.103:2379 | 6639bf9141f6845c |  3.2.11 |   25 kB |     false |         2 |       1266 |
+----------------------------+------------------+---------+---------+-----------+-----------+------------+

```

### Sucesso!!! \O/

<h2 align="center">
    <i>
        Pronto!!! <br/>
        Agora você tem um ambiente virtual em cluster CoreOS<br/>
        Provisionado pelas ferramentas Packer, Vagrant e Shell Script.
    </i>
</h2>

Resultado final semelhante a imagem abaixo:
<p align="center">
    <img src="https://github.com/alisonbuss/cluster-coreos-basic-vagrant/raw/master/files/print-vagrant-cluster.png" alt="print-vagrant"/>
</p>

### Referências:

* Professor José de Assis - YouTube, Playlist ***Curso - Primeiros passos com Servidor Linux*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://www.youtube.com/playlist?list=PLbEOwbQR9lqy926a_ArLcUL2gHJYuu8XK](https://www.youtube.com/playlist?list=PLbEOwbQR9lqy926a_ArLcUL2gHJYuu8XK)*

* Aula EAD Blog, Curso com José de Assis, ***Primeiros passos com Servidor Linux*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[http://www.aulaead.com/courses/curso-gratis-servidor-linux](http://www.aulaead.com/courses/curso-gratis-servidor-linux)*

* Vagrant - Official Site, Vagrant Documentation. ***Command-Line Interface*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://www.vagrantup.com/docs/cli/](https://www.vagrantup.com/docs/cli/)*

* Vagrant - Official Site, Vagrant Documentation. ***Vagrantfile*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://www.vagrantup.com/docs/vagrantfile/](https://www.vagrantup.com/docs/vagrantfile/)*

* Yet Emerging Technologies - Blog, by Sébastien Braun. ***CoreOS Container Linux*** <br/>
  Acessado: *Sei lá da pesti, foi em 2018 por ai...* <br/>
  Disponível: *[http://www.yet.org/2017/03/01-container-linux/](http://www.yet.org/2017/03/01-container-linux/)*

* CoreOS - GitHub, Rep: coreos-vagrant. ***Minimal Vagrantfile for Container Linux*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://github.com/coreos/coreos-vagrant/](https://github.com/coreos/coreos-vagrant/)*

* Alison Buss - GitHub, Rep: coreos-kids-vagrant. ***Exemplo de um Vagrantfile subindo varias VM CoreOS sobre uma configuração simples*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://github.com/alisonbuss/coreos-kids-vagrant/](https://github.com/alisonbuss/coreos-kids-vagrant/)*

* Alison Buss - GitHub, Rep: coreos-packer. ***Projeto de criação de imagens CoreOS para múltiplas plataformas (Amazon EC2, Google GCE, DigitalOcean, VirtualBox)*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://github.com/alisonbuss/coreos-packer/](https://github.com/alisonbuss/coreos-packer/)*

* CoreOS - Official Site, CoreOS Documentation. ***Running CoreOS Container Linux on Vagrant*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/os/docs/latest/booting-on-vagrant.html](https://coreos.com/os/docs/latest/booting-on-vagrant.html)*

* CoreOS - Official Site, CoreOS Documentation. ***Container Linux automates machine provisioning with a specialized system for applying initial configuration*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/os/docs/latest/provisioning.html](https://coreos.com/os/docs/latest/provisioning.html)*

* LinuxConfig - Blog, Official Blog. ***How to set/change a hostname on CoreOS Linux*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://linuxconfig.org/how-to-set-change-a-hostname-on-coreos-linux](https://linuxconfig.org/how-to-set-change-a-hostname-on-coreos-linux)*

* CoreOS - Official Site, CoreOS Documentation. ***CoreOS Container Linux cluster discovery*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/os/docs/latest/cluster-discovery.html](https://coreos.com/os/docs/latest/cluster-discovery.html)*

* Etcd - Official Site, Etcd Documentation. ***Clustering Guide - Discovery*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/etcd/docs/latest/op-guide/clustering.html#discovery](https://coreos.com/etcd/docs/latest/op-guide/clustering.html#discovery)*

* CoreOS - Official Site, CoreOS Documentation. ***Customizing docker*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/os/docs/latest/customizing-docker.html](https://coreos.com/os/docs/latest/customizing-docker.html)*

* @mohitarora - Medium Blog, by Mohit Arora. ***Manage Docker Containers using CoreOS - Part 1*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://medium.com/@mohitarora/manage-docker-containers-using-coreos-part-1-c1b401bc0aab](https://medium.com/@mohitarora/manage-docker-containers-using-coreos-part-1-c1b401bc0aab)*

* Yet Emerging Technologies - Blog, by Sébastien Braun. ***rkt - yet emerging container runtime*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[http://www.yet.org/2017/03/rkt/](http://www.yet.org/2017/03/rkt/)*

* Etcd - Official Site, Etcd Documentation. ***Demo, series of examples shows the basic procedures for working with an etcd cluster*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/etcd/docs/latest/demo.html](https://coreos.com/etcd/docs/latest/demo.html)*

* Etcd - Official Site, Etcd Documentation. ***Clustering Guide*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/etcd/docs/latest/op-guide/clustering.html](https://coreos.com/etcd/docs/latest/op-guide/clustering.html)*

* Etcd2 - Official Site, Etcd2 Documentation. ***Clustering Guide for Etcd2*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/etcd/docs/latest/v2/clustering.html](https://coreos.com/etcd/docs/latest/v2/clustering.html)*

* Etcd - Official Site, Etcd Documentation. ***Etcd cluster runtime reconfiguration on CoreOS Container Linux*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/etcd/docs/latest/etcd-live-cluster-reconfiguration.html](https://coreos.com/etcd/docs/latest/etcd-live-cluster-reconfiguration.html)*

* Flannel - Official Site, Flannel Documentation. ***Running flannel*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/flannel/docs/latest/running.html](https://coreos.com/flannel/docs/latest/running.html)*

* Flannel - Official Site, Flannel Documentation. ***Configuring flannel for container networking*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/flannel/docs/latest/flannel-config.html](https://coreos.com/flannel/docs/latest/flannel-config.html)*

* Flannel - Official Site, Flannel Documentation. ***Configuration - flannel reads its configuration from etcd*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/flannel/docs/latest/configuration.html](https://coreos.com/flannel/docs/latest/configuration.html)*

* CoreOS - GitHub, Rep: flannel, Issue: #554. ***Flannel + etcdv3? #554*** <br/>
  Acessado: *Sei lá da pesti, foi em 2018 por ai...* <br/>
  Disponível: *[https://github.com/coreos/flannel/issues/554](https://github.com/coreos/flannel/issues/554)*

* CoreOS - Official Site, CoreOS Documentation. ***Network configuration with networkd*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://coreos.com/os/docs/latest/network-config-with-networkd.html](https://coreos.com/os/docs/latest/network-config-with-networkd.html)*

* UpCloud - Official Site, Tutorials. ***How to Configure Floating IP on CoreOS*** <br/>
  Acessado: *Sei lá da pesti, foi em 2017 por ai...* <br/>
  Disponível: *[https://www.upcloud.com/support/configure-floating-ip-coreos/](https://www.upcloud.com/support/configure-floating-ip-coreos/)*

### Licença

[<img width="190" src="https://raw.githubusercontent.com/alisonbuss/my-licenses/master/files/logo-open-source-550x200px.png">](https://opensource.org/licenses)
[<img width="166" src="https://raw.githubusercontent.com/alisonbuss/my-licenses/master/files/icon-license-mit-500px.png">](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/blob/master/LICENSE)
