class CreateStasiuns < ActiveRecord::Migration[5.0]
  def change
    create_table :stasiuns do |t|
      t.string :nama
      t.references :provinsi, foreign_key: true

      t.timestamps
    end
  end
end
