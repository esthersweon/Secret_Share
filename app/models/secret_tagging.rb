class SecretTagging < ActiveRecord::Base
  belongs_to :secret
  belongs_to :tag

  validates :secret_id, :tag_id, presence: true
  validates :tag_id, uniqueness: {scope: :secret_id}

end
