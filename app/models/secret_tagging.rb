class SecretTagging < ActiveRecord::Base
  validates :secret, :tag, presence: true

  belongs_to :secret,
    class_name: "Secret",
    foreign_key: :secret_id,
    primary_key: :id,
    inverse_of: :secret_taggings


  belongs_to :tag,
    class_name: "Tag",
    foreign_key: :tag_id,
    primary_key: :id

end
