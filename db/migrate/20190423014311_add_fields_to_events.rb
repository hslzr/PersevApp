class AddFieldsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :name, :string
    add_column :events, :starts_at, :timestamp
    add_column :events, :ends_at, :timestamp
  end
end
