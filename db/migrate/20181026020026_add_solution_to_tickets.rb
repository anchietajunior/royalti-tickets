class AddSolutionToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :solution, :text
  end
end
