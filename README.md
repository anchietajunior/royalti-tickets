# Royal TI tickets

## Versões de linguagem e framework

* Ruby 2.5.1

* Rails 5.2.0

## Instalação

* bundle install

* rails db:create

* rails db:migrate

* rails db:seed

* rails server

## Criação de usuário

* rails c

* User.create!(name: "Your Name", email: "yourmail@mail.com", password: "your password", password_confirmation: "your password")

## Executando testes

### Todos os testes

* rspec

### Testes de model

* rspec spec/models

### Testes de controller

* rspec spec/controllers

### Testes de facade

* rspec spec/facades