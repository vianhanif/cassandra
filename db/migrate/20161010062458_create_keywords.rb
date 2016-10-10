class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.string :nama
      t.references :bencana, foreign_key: true

      t.timestamps
    end
  end
end
