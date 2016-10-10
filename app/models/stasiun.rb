class Stasiun < ApplicationRecord
  belongs_to :provinsi

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Stasiun.find_or_create_by! row.to_hash
    end
  end
end
