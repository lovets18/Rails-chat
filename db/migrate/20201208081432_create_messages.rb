class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content

      t.references :user, null: false, foreign_key: false
      t.timestamps
    end
  end
end
