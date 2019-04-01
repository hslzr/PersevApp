class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :hexid
      t.datetime :starts_at
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
