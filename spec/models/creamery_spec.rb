require 'rails_helper'

RSpec.describe Creamery, type: :model do
    let(:creamery1) { Creamery.create!(name: 'the creamery', date_founded: 1950, owner: 'bob', head_cheesemaker: 'joe maker', location: 'new york', farmstead: true, acreage: 400, awards_won: 'best in class') }
    let(:creamery2) { Creamery.create!(name: 'The Creamery', date_founded: 1950, owner: 'Bob', head_cheesemaker: 'Joe Maker', location: 'New York', farmstead: true, acreage: 400, awards_won: 'Best in Class') }
    describe 'instance methods' do
        describe '#creamery?' do
            it 'returns true when the name contains the word creamery' do
                expect(creamery1.creamery?).to be(true)
            end

            it 'is case insensitive when checking if the name contains the word creamery' do
                expect(creamery2.creamery?).to be(true)
            end
        end

        describe '#bob?' do
            it 'returns true when the owner contains the word bob' do
                expect(creamery1.bob?).to be(true)
            end

            it 'is case insensitive when checking if the owner contains the word bob' do
                expect(creamery2.bob?).to be(true)
            end
        end

        describe '#joe?' do
            it 'returns true when the cheesemaker contains the word joe' do
                expect(creamery1.joe?).to be(true)
            end

            it 'is case insensitive when checking if the cheesemaker contains the word joe' do
                expect(creamery2.joe?).to be(true)
            end
        end

        describe '#new_york?' do
            it 'returns true when the location contains the words new york' do
                expect(creamery1.new_york?).to be(true)
            end

            it 'is case insensitive when checking if the location contains the words new york' do
                expect(creamery2.new_york?).to be(true)
            end
        end

        describe '#best?' do
            it 'returns true when the awards won contains the word best' do
                expect(creamery1.best?).to be(true)
            end

            it 'is case insensitive when checking if the awards won contains the word best' do
                expect(creamery2.best?).to be(true)
            end
        end

        describe '#date_founded' do
            it 'returns true when the date founded is four digits long'
        end

        describe '#farmstead' do
            it 'returns true when yes is selected for farmstead'
        end

        describe '#acreage' do
            it 'returns true when the acreage is an integer'
        end

        describe '#total_cheeses' do
            it 'returns total number of cheeses produced'
        end
    end
end