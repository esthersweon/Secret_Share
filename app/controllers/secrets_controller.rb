class SecretsController < ApplicationController
  def index
    @secrets = Secret.where(recipient_id: params[:user_id])
    render json: @secrets.to_json(include: :tags)
  end

  def new
    @user = User.find(params[:user_id])
    @secret = Secret.new
  end

  def create
    @secret = current_user.authored_secrets.new(secret_params)
    if @secret.save
      render :json => @secret.to_json(include: :tags)
      redirect_to user_url(@secret.recipient_id)
    else
      console.log("fail")
      flash.now[:errors] = @secret.errors.full_messages
      render :new
      # redirect_to user_url(@secret.recipient_id)
    end
  end

  private

  def secret_params
    params.require(:secrets).permit(:title, :recipient_id,  :tag_ids => [] )
  end
end
