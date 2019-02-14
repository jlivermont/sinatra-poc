class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :description
      t.timestamps
    end

    create_table :entries do |t|
      t.belongs_to :todo, index: true
      t.string :message
      t.boolean :done, default: false
      t.timestamps
    end
  end
end
