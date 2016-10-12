class AddStasiunToBmkg < ActiveRecord::Migration[5.0]
  def change
    add_reference :bmkgs, :stasiun, foreign_key: true
  end
end
