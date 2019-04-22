class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :accounts do |t|
      t.string :name
      t.string :uuid, default: 'uuid_generate_v4()'

      t.timestamps
    end

    add_index :accounts, :uuid, unique: true
    add_reference :calendars, :account, index: true, foreign_key: true
    add_reference :events, :account, index: true, foreign_key: true
    add_reference :groups, :account, index: true, foreign_key: true
    add_reference :sections, :account, index: true, foreign_key: true
    add_reference :users, :account, index: true, foreign_key: true
  end
end
