
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
* **[[GNU Make](https://www.gnu.org/software/make/)]**

> **Nota:**
> *É necessário ter instalado as dependências citadas acima, para que o projeto funcione.*


## Dependência de projetos:

* **[[coreos-packer](https://github.com/alisonbuss/coreos-packer/)]** - Esse projeto cria IMAGENS CoreOS utilizando **"[Ignition](https://coreos.com/ignition/docs/latest/)"** para as plataformas: (Amazon EC2, Google GCE, DigitalOcean, VirtualBox, ...) e de quebra gerar um "**[Vagrant Box](https://www.vagrantup.com/docs/boxes/base.html)**".

> **Nota:**
> *Para subir um cluster CoreOS de 3 nós pelo Vagrant, vai ser utilizado um "**[Vagrant Box](https://www.vagrantup.com/docs/boxes/base.html)**" gerado pelo projeto **[coreos-packer](https://github.com/alisonbuss/coreos-packer/)** .*


## Objetivo:



## Documentação de apoio:

* **[CoreOS Documentation](https://coreos.com/os/docs/latest/cluster-architectures.html)**.
* **[Packer Documentation](https://www.packer.io/docs/index.html)**.
* **[Vagrant Documentation](https://www.vagrantup.com/docs/index.html)**.



## Estrutura do Projeto:

<h1 align="center">
    <img src="https://github.com/alisonbuss/cluster-coreos-basic-vagrant/raw/master/files/diagrama-1.png" alt="print-vagrant"/>
</h1>

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
