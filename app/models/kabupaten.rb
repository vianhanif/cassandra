class Kabupaten < ApplicationRecord
  default_scope { order('nama ASC') }
  belongs_to :provinsi
  # has_many :bnpbs, dependent: :destroy
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Kabupaten.find_or_create_by! row.to_hash
    end
  end
end
