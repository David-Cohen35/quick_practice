class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string :name, null: false, unique: true, index: true
      t.references :toyable, polymorphic: true, index: true
      # t.integer :toyable_id, index: true
      # t.string :toyable_type
    end
    add_index :toys, [:name, :toyable_id, :toyable_type], unique: true
  end
end
