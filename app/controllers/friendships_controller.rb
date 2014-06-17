class FriendshipsController < ApplicationController
  def create
    sleep 1;
    current_user.out_friendships.new(in_friend_id: params[:user_id]).save!
    head :ok
  end

  def destroy
    sleep 1;
    current_user
      .out_friendships
      .where(in_friend_id: params[:user_id])
      .first
      .destroy
    head :ok
  end
end