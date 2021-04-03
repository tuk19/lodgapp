class Inn < ApplicationRecord
    def self.search(search)
        if search
            Inn.where(['address LIKE ?', "%#{search}%"])
        else
            Inn.all
        end
    end


    mount_uploader :image, ImageUploader
    belongs_to :user
    belongs_to :reserv
end
