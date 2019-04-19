class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.integer :number
      t.string :name

      t.timestamps
    end

    # Adds group reference to users
    add_reference :users, :group, index: true, foreign_key: true
  end
end
