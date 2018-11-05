FactoryBot.define do
	factory :priority do
		name {[ "Alta", "Imediata", "Baixa", "Executar as demais"].sample}
    level { [0, 1, 2, 3, 4, 5, 6].sample }
	end
end
