class Tag < ApplicationRecord
    has_many :mcd_tag_relations, dependent: :destroy
    has_many :mcds, through: :mcd_tag_relations, dependent: :destroy
end
