class CreateBencanas < ActiveRecord::Migration[5.0]
  def change
    create_table :bencanas do |t|
      t.string :nama

      t.timestamps
    end
  end
end
