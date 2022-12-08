class CreateNottes < ActiveRecord::Migration[6.1]
  def change
    create_table :nottes do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
