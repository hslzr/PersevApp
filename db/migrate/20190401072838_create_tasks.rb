class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.boolean :complete, default: false
      t.datetime :starts_at

      t.text :economic_resources
      t.text :human_resources
      t.text :material_resources

      t.timestamps
    end
  end
end
