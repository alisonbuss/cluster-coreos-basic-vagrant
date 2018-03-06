
#### Translation for: **[English](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/blob/master/README_LANG_EN.md)**. 


## Projeto: "cluster-coreos-basic-vagrant"

<h1 align="center">
    Subir um cluster CoreOS de 3 instâncias <br/>usando <br/ >"Packer e Vagrant"
</h1>

<h1 align="center">
    <img src="https://github.com/alisonbuss/cluster-coreos-basic-vagrant/raw/master/files/print-vagrant.png" alt="print-vagrant"/>
</h1>


## Inspirado nos projetos:

* **[[coreos-vagrant](https://github.com/coreos/coreos-vagrant/)]** - Do repositório oficial do CoreOS.
* **[[coreos-kids-vagrant](https://github.com/alisonbuss/coreos-kids-vagrant/)]** - Exemplo de um Vagrantfile subindo varias VM CoreOS sobre uma configuração simples
* **[[coreos-packer](https://github.com/alisonbuss/coreos-packer/)]** - Projeto de criação de imagens CoreOS para múltiplas plataformas (Amazon EC2, Google GCE, DigitalOcean, VirtualBox).


## Dependência de ferramentas:

* **[[VirtualBox](https://www.virtualbox.org/)]** 4.3.10 ou superior...
* **[[Vagrant](https://www.vagrantup.com/)]** 1.6.3 ou superior...
* **[[Packer](https://www.packer.io/)]** 1.1.3 ou superior...
* **[[Container Linux Config Transpiler](https://github.com/coreos/container-linux-config-transpiler)]** 0.5.0 ou superior...
* **[[GNU Make](https://www.gnu.org/software/make/)]**

> **Nota:**
> *É necessário ter instalado as dependências citadas acima, para que o projeto funcione.*



## Dependência de projetos:

* **[[coreos-packer](https://github.com/alisonbuss/coreos-packer/)]** Esse projeto é responsável por criar imagens para múltiplas plataformas e na subsequencia gera um "**[Vagrant Box](https://www.vagrantup.com/docs/boxes/base.html)**".

> **Nota:**
> *Para subir um cluster pelo Vagrant, vai ser utilizado um "**[Vagrant Box](https://www.vagrantup.com/docs/boxes/base.html)**" gerado pelo projeto citado acima "**[coreos-packer](https://github.com/alisonbuss/coreos-packer/)**".*



## Objetivo:

Fornecer um projeto de "Infrastructure as Code (IaC)" de um cluster CoreOS baseado em uma **[Imagem Packer](https://github.com/alisonbuss/coreos-packer/)** e fornecer um ambiente 3 hosts, e que em cada host tenha 
em execução e os serviços (Docker, Rkt, Etcd-2, Etcd-3, Flannel) e garantir que o "Etcd-Server" de cada host 
se comuniquem entre si, formando um cluster funcional, básico e simples.

O ambiente será semelhante a proposta da documentação oficial do CoreOS citada abaixo:

- Executando CoreOS Container Linux em Vagrant -> https://coreos.com/os/docs/latest/booting-on-vagrant.html
- Demo com uma série de exemplos mostra os procedimentos básicos para trabalhar com um cluster ETDC -> https://coreos.com/etcd/docs/latest/demo.html
- Guia de Clusterização ETCD -> https://coreos.com/etcd/docs/latest/op-guide/clustering.html

## Ambiente Proposto:

### Imagem: 

- [CoreOS Stable 1632.3.0](https://coreos.com/releases/)
  - kernel: v4.14.19
  - systemd: v235
  - ignition: v0.20.1
  - rkt: v1.29.0
  - docker: v17.09.1
  - docker-compose: v1.19.0
  - etcd v3.2.11
  - flannel v0.7.0
  - active-python: v2.7.13

### Ambiente: 

Fornecer um cluster virtual de 3 hosts, para cada "host ou instancia" alguns dados específicos:

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

> **Nota:**
> *Para cada cluster criado pelo Vagrant, será gerado automaticamente um **[token de descoberta para Etcd](https://coreos.com/os/docs/latest/cluster-discovery.html)**.*

Para cada host sera aplicando provisionamento básico em arquivos de Shell Scripts:

    ./provision/shell-script/config-init.sh
    ./provision/shell-script/config-network.sh
    ./provision/shell-script/config-storage-unit.sh
    ./provision/shell-script/config-rkt.sh
    ./provision/shell-script/config-docker.sh
    ./provision/shell-script/config-etcd.sh
    ./provision/shell-script/config-flannel.sh
    ./provision/shell-script/config-security.sh

### Diagrama do Ambiente:

<h1 align="center">
    <img src="https://github.com/alisonbuss/cluster-coreos-basic-vagrant/raw/master/files/diagrama-1.png" alt="diagrama"/>
</h1>



## Documentação de apoio:

* **[CoreOS Documentation](https://coreos.com/os/docs/latest/cluster-architectures.html)**.
* **[Packer Documentation](https://www.packer.io/docs/index.html)**.
* **[Vagrant Documentation](https://www.vagrantup.com/docs/index.html)**.



## Estrutura do Projeto:


## $ Executando o projeto ([coreos-packer](https://github.com/alisonbuss/coreos-packer/)) usando Packer.


## $ Executando o projeto ([cluster-coreos-basic-vagrant](https://github.com/alisonbuss/cluster-coreos-basic-vagrant/)) usando Vagrant.


## Sucesso!!! \O/


## Referências:

* Canal YouTube Bóson Treinamentos, Fábio dos Reis. ***Programação no Linux*** 
  Acessado: *29 de Julho de 2017.*
  Disponível: *[https://www.youtube.com/playlist?list=PLucm8g_ezqNrYgjXC8_CgbvHbvI7dDfhs](https://www.youtube.com/playlist?list=PLucm8g_ezqNrYgjXC8_CgbvHbvI7dDfhs)*.
* Shell Scriptx Blog, Shamam. ***Trabalhando com funções Shell*** 
  Acessado: *19 de Setembro de 2017.*
  Disponível: *[http://shellscriptx.blogspot.com.br/2016/12/trabalhando-com-funcoes.html](http://shellscriptx.blogspot.com.br/2016/12/trabalhando-com-funcoes.html)*.
* mhavila, Márcio d'Ávila. ***Scripts Shell sob Controle*** 
  Acessado: *19 de Setembro de 2017.*
  Disponível: *[http://www.mhavila.com.br/topicos/unix/shscript.html](http://www.mhavila.com.br/topicos/unix/shscript.html)*.


## Licença

- [GPL-3.0: GNU General Public License v3.0](https://github.com/alisonbuss/garden-of-eden/blob/master/LICENSE)
