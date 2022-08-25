class Creamery < ApplicationRecord
    def creamery?
        return true if name.downcase.include? 'creamery'
    end
end