class Plant < ActiveRecord::Base
    
    has_many :plant_categories
    has_many :categories, through: :plant_categories
    has_many :plant_parenthoods
    has_many :people, through: :plant_parenthoods
    has_many :waterings
    has_many :waterers, through: :waterings

    def number_of_days_since_last_watering
        all_waterings = Watering.order( created_at: :desc )
        last_watering = all_waterings.select{ | watering | watering.plant_id == self.id }.first
        days_since = ( Date.today - last_watering.created_at.to_date ).to_i
        puts "I was last watered #{ days_since } days ago"
    end

end
