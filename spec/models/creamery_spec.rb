require 'rails_helper'

RSpec.describe Creamery, type: :model do
    describe 'instance methods' do
        describe '#creamery?' do
            it 'returns true when the name is creamery' do
                creamery = Creamery.create!(name: 'creamery', date_founded: 1950, owner: 'cheddar man', head_cheesemaker: 'joe maker', location: 'new york', farmstead: true, acreage: 400, awards_won: 'best in class')

                expect(creamery.creamery?).to be(true)
            end
        end
    end
end