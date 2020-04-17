class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {scope: %i[released_year artist_name]}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true

#will ask for a valid release year if the song has been released
  with_options if: :released? do 
    validates :released_year, presence: true
    validates :released_year, numericality: {less_than_or_equal_to: Date.today.year}
  end

  def released?
    released
  end
end
