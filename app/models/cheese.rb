class Cheese < ApplicationRecord
    belongs_to :creamery

    def self.veg_rennet
        where(veg_rennet: true)
    end
end