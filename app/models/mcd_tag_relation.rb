class McdTagRelation < ApplicationRecord
  belongs_to :mcd
  belongs_to :tag
end
