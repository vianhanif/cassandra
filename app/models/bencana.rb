class Bencana < ApplicationRecord

  extend FriendlyId
  friendly_id :nama, use: :slugged

  def name
    nama
  end

  has_many :bnpbs, dependent: :destroy
  # has_many :polas, dependent: :destroy
  has_many :keywords, dependent: :destroy
  has_many :sosialmedias, dependent: :destroy
  has_many :twitters, dependent: :destroy
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Bencana.find_or_create_by! row.to_hash
    end
  end
end
