# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Victor Reis", email: "victor@royalti.com.br", password: "12345678")
admin = User.create!(name: "Natan Miguel", email: "natan@royalti.com.br", password: "12345678")
User.create!(name: "Marcus Aurélio", email: "marcos@royalti.com.br", password: "12345678")
User.create!(name: "Anchieta Júnior", email: "santosjr87@gmail.com", password: "88533146Jr")

Status.create!(name: "Aberta", level: 6)
Status.create!(name: "Em execução", level: 5)
Status.create!(name: "Pausada", level: 4)
Status.create!(name: "Pausada esperando cliente", level: 3)
Status.create!(name: "Pausada esperando fornecedor", level: 2)
Status.create!(name: "Agendada", level: 1)
Status.create!(name: "Finalizada", level: 0)

Priority.create!(name: "Imediato", level: 4)
Priority.create!(name: "Alta", level: 3)
Priority.create!(name: "Média", level: 2)
Priority.create!(name: "Baixa", level: 1)
Priority.create!(name: "Executar as demais", level: 0)

10.times do |customer|
  Customer.create!(name: Faker::Company.name)
end

1000.times do
  Ticket.create!(
    description: Faker::Lorem.sentence,
    customer: Customer.all.sample,
    admin_id: admin.id,
    user_id: User.all.sample.id,
    status: Status.all.sample,
    priority: Priority.all.sample
  )
end
