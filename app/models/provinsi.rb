class Provinsi < ApplicationRecord
  has_many :kabupatens

  default_scope { order('nama ASC') }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Provinsi.find_or_create_by! row.to_hash
    end
  end
end
