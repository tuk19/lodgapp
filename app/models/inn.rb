class Inn < ApplicationRecord
    def self.search(search, keyword)
        if search
            Inn.where(['address LIKE ?', "%#{search}%"])
        elsif keyword
            Inn.where(['name LIKE ? OR address LIKE ? OR introduction LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
        else
            Inn.all
        end
    end


    mount_uploader :image, ImageUploader
    belongs_to :user
    belongs_to :reserv, optional: true
end
