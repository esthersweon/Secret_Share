class SecretTagging < ActiveRecord::Base
  belongs_to :secret, inverse_of: :secret_taggings
  belongs_to :tag, inverse_of: :secret_taggings

  validates :secret_id, :tag_id, presence: true
  validates :tag_id, uniqueness: {scope: :secret_id}

end
