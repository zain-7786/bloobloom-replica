# frozen_string_literal: true

class Api::Admin:UsersController < Api::Admin::BaseController
before_action :set_user, only: %i[update destroy]

def index
	users = User.all

	render json: users
end

def create
	@user = User.new(user_params)

	if @user.save
	  render json: @user
	else
	  render_errors(@user.errors.full_messages.presence, :unprocessable_entity)
  end
end

def update
	if @user.update(user_params)
	  render json: @user
	else
	  render_errors(@user.errors.full_messages.presence, :unprocessable_entity)
	end
end

def destroy
  if @user.destroy
    render json: @user
  else
    render_errors(@user.errors.full_messages.presence || 'Failed to delete user',
                    :unprocessable_entity)
  end
end

private

  def user_params
    params.require(:user).permit(:id, :name)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  	return render_errors('User not found!', :not_found) if @user.nil?
  end
end
