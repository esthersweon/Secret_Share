class FriendshipsController < ApplicationController
  def create
    sleep 2;
    current_user.out_friendships.new(in_friend_id: params[:user_id]).save!
    head :ok
  end

  def destroy
    sleep 2;
    current_user
      .out_friendships
      .where(in_friend_id: params[:user_id])
      .first
      .destroy
    head 200
  end
end
