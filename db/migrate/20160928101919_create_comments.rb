class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :blog, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end