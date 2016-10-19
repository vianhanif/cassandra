class Bencana < ApplicationRecord

  extend FriendlyId
  friendly_id :nama, use: :slugged

  def name
    nama
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Bencana.find_or_create_by! row.to_hash
    end
  end
end
