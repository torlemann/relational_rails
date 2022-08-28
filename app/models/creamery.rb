class Creamery < ApplicationRecord
    has_many :cheeses, dependent: :destroy
    validates_presence_of :name
    validates_presence_of :date_founded
    validates_presence_of :owner
    validates_presence_of :head_cheesemaker
    validates_presence_of :location
    validates_presence_of :farmstead
    validates_presence_of :acreage
    validates_presence_of :awards_won
    validates :farmstead, inclusion: [true, false]

    def self.ordered
        order(created_at: :asc)
    end
end