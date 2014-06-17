class SecretsController < ApplicationController
  before_filter :require_current_user!

  def new
    @secret.recipient_id = params[:user_id]
    @secret = Secret.new

    render :new
  end

  def create
    tag_ids = tag_params
    @secret = current_user.authored_secrets.new(secret_params)

    tag_ids.each do |tag_id|
      @secret.secret_taggings.new(tag_id: tag_id)
    end

    if @secret.save
      render json: @secret, head: :ok
    else
      render :new
    end
  end

  # def destroy
  #   @secret = Secret.where(id: params[:id]).first
  #   @secret.destroy!
  #   redirect_to user_url(@secret.recipient_id)
  # end

  private

  def secret_params
    params.require(:secret).permit(:title, :recipient_id)
  end

  def tag_params
    params.require(:secret).permit(:tag_ids)
  end
end
