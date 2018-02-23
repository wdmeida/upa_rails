# UPA Rails

[![Build Status](https://travis-ci.org/wdmeida/upa_rails.svg?branch=master)](https://travis-ci.org/wdmeida/upa_rails)

Projeto prático desenvolvido durante o minicurso de Ruby on Rails, ministrado a membros da Associação Comunitária do Bairro Boa Vista, na cidade de Barbacena - MG.

## Projeto

A aplicação simula o controle de funcionários, pacientes e atendimentos de uma Unidade de Pronto Atendimento (UPA) e foi desenvolvido utilizando:

* [Ruby on Rails](http://rubyonrails.org/)
* [Bootstrap 4.0 Beta](https://getbootstrap.com/docs/4.0/getting-started/introduction/)
* [RSpec](http://rspec.info/)
* [Ransack](https://github.com/activerecord-hackery/ransack)

## Executando o projeto

Para executar o projeto, é necessário ter o Ruby e o Ruby on Rails instalados. Logo após, faça o clone do projeto para um diretório local, entre no diretório ```upa_rails``` e instale as dependências:

```$ bundle install```

Crie o banco de dados e execute as migrações do mesmo:

```$ rails db:create db:migrate```

Gere a base de dados para testes executando as tasks:

```$ rails db:seed setup:development```

Caso tenha a gem [foreman](https://github.com/ddollar/foreman) instalada, execute a aplicação com o comando:

```$ foreman start```

Em caso contrário, basta executar a aplicação executando o servidor padrão do rails:

```$ rails s```

Para acessar a aplicação basta acessar os seguinte endereços no navegador:

* ```http://localhost:3000``` - Acessa a area de serviços do sistema. Um usuário e senha padrão são gerados na hora em que foi executada a task ```db:seed``` e possuem os seguintes valores:

  * **Usuário**: user@user.com
  * **Senha**: 123456


* ```http://localhost:3000/backoffice``` - Acessa a area administrativa do sistema. Um usuário e senha padrão são gerados na hora em que foi executada a task ```db:seed``` e possuem os seguintes valores:

  * **Usuário**: admin@admin.com
  * **Senha**: 123456
  

## Executando os testes

Para executar os testes, basta executar o comando (**não esquecer de criar o banco de dados caso vá executar os testes antes do sistema**):

```$ bundle exec spring rspec -fd```

*Obs: A flag **-fd** é para que o resultado dos testes seja exibido em formato de documentação.

