FactoryBot.define do
  factory :status do
    name { ["Aberta", "Aguardando cliente", "Aguardando fornecedor", "Finalizada"] }
    level { [0, 1, 2, 3, 4].sample }
  end
end
