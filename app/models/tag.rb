class Tag < ActiveRecord::Base
  validates :title, presence: true
  has_many :secret_taggings, inverse_of: :tag
  has_many :secrets,
    through: :secret_taggings,
    source: :secret
end
