class Bnpb < ApplicationRecord
  # default_scope { order('tanggal DESC') }

  belongs_to :bencana
  belongs_to :kabupaten


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Bnpb.find_or_create_by! row.to_hash
    end
  end

end
