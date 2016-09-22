class CreateKabupatens < ActiveRecord::Migration[5.0]
  def change
    create_table :kabupatens do |t|
      t.string :nama
      t.references :provinsi, foreign_key: true

      t.timestamps
    end
  end
end
