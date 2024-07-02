class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users = User.all
    respond_to do |format|
      format.json { render json: users.to_json }
    end
  end

  def create
    user = User.new(user_params);
    if user.save
      render json: { message: "User #{user.name} was successfully created." }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def filter
    campaign_names = params[:campaign_names]&.split(',')
    users = User.with_campaign_names(campaign_names)
    debugger
    respond_to do |format|
      format.json { render json: users.to_json }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, campaigns_list: [:campaign_name, :campaign_id]).tap do |p|
      p[:campaigns_list] = p[:campaigns_list].map(&:to_h)
    end
  end
end
