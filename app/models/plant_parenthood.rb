class PlantParenthood < ActiveRecord::Base

     belongs_to :person
     belongs_to :plant

    # def plant_parents
    #     # before ActiveRecord
    #     PlantParent.all.select{|plant_parent| plant_parent == self.plant_parents}
    #     # AR:
    #     id_num = self.plant_parent_id
    #     PlantParent.find(id_num)
    # end

    def cap_affection
        PlantParenthood.update( self.id, affection: self.affection.clamp( 0, 11000 ) )
        # self.affection = self.affection.clamp( 0, 11000 )
        # self.save
    end
    
end