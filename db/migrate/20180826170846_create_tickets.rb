class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :description
      t.references :customer, foreign_key: true
      t.references :admin
      t.references :user
      t.references :priority, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
