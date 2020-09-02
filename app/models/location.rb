class Location < ApplicationRecord
    require 'CSV'
    def self.import(file)
        h = CSV.open(file, headers: :first_row).map do |row| 
            row.to_h.merge!(created_at: DateTime.now, updated_at: DateTime.now)
        end
        Location.insert_all!(h)
    end
end
