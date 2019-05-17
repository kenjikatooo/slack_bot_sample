class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string           :username,     null: false, default: ''
      t.string           :usercode,     null: false
      t.unsigned_integer :tip_count,    null: false, default: 0
      t.unsigned_integer :memo_count,   null: false, default: 0
      t.unsigned_integer :output_count, null: false, default: 0
      t.unsigned_integer :advice_count, null: false, default: 0
      t.unsigned_integer :coin,         null: false, default: 0
    end

    add_index :users, :usercode, unique: true
  end
end
