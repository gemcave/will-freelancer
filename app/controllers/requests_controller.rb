class RequestsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_request, except: [:new, :create, :index, :list]
	before_action :is_authorised, only: [:edit, :update, :destroy]


  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  def list
	end
	
	private

	def set_request
		@request = Request.find(params[:id])
	end

	def is_athorize
		redirect_to root_path, alert: "You don't have permission" unless current_user.id == @request.user_id
	end

	def request_params
		params.require(:request).permit(:description, :category_id, :delivery_time, :budget, :attachment_file, :title)
	end
end
