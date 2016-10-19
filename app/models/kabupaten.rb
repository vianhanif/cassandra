class Kabupaten < ApplicationRecord
  belongs_to :provinsi

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Kabupaten.find_or_create_by! row.to_hash
    end
  end
end
