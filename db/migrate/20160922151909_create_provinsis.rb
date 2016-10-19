class CreateProvinsis < ActiveRecord::Migration[5.0]
  def change
    create_table :provinsis do |t|
      t.string :nama

      t.timestamps
    end
  end
end
