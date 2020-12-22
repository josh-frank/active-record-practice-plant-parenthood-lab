class Person < ActiveRecord::Base

    has_many :plant_parenthoods
    has_many :plants, through: :plant_parenthoods
    has_many :waterings
    has_many :waterees, through: :waterings

    def water_plant( plant_to_water )
        find_parenthood = PlantParenthood.find_by( plant_id: plant_to_water.id , person_id: self.id )
        Watering.create( plant_id: plant_to_water.id , person_id: self.id )
        PlantParenthood.update( find_parenthood.id, affection: find_parenthood.affection + 1 ) if !find_parenthood.nil?
    end

end