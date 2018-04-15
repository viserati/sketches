class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :country

      t.timestamps null: false
    end
  end
end
