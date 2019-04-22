class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.references :group

      t.timestamps
    end

    add_reference :users, :section, index: true, foreign_key: true
  end
end
