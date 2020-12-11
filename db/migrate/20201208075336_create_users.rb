class CreateUsers < ActiveRecord::Migration[6.0]
  #has_many :messages, :dependent => :destroy
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest


      t.remove_foreign_key :message

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
