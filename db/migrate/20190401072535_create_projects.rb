class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :hexid
      t.datetime :starts_at
      t.boolean :complete, default: false
      t.integer :field, default: 0

      t.text :general_objective
      t.text :particular_objective
      t.text :evaluation_criteria

      t.string :adviser

      t.timestamps
    end

    add_index :projects, :hexid
  end
end
