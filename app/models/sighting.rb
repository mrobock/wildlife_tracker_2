class Sighting < ActiveRecord::Base
  before_save :region_setter
  belongs_to :animal
  validates :animal_id, presence: true
  validates :latitude, numericality: {
    greater_than_or_equal_to: 0,
    less_than: 400}

  private
    def region_setter
      if latitude >= 0 && latitude < 100
        self.region = "1"
      elsif latitude >= 100 && latitude < 200
        self.region = "2"
      elsif latitude >= 201 && latitude < 300
        self.region = "3"
      elsif latitude >= 301 && latitude < 400
        self.region = "4"
      end
    end
end
