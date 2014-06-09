class Friendship < ActiveRecord::Base
  belongs_to :in_friend,
    class_name: "User",
    foreign_key: :in_friend_id

  belongs_to :out_friend,
    class_name: "User",
    foreign_key: :out_friend_id


  def self.can_friend?(out_friend_id, in_friend_id)
    return false if out_friend_id == in_friend_id
    array_friendships = Friendship.where(out_friend_id: out_friend_id,
      in_friend_id: in_friend_id)
    array_friendships.empty?
  end

  def self.can_unfriend?(out_friend_id, in_friend_id)
    return false if out_friend_id == in_friend_id
    array_friendships = Friendship.where(out_friend_id: out_friend_id,
      in_friend_id: in_friend_id)
    !array_friendships.empty?
  end
end
