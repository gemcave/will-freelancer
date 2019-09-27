class PagesController < ApplicationController
  def home
	end
	
	def search
		@categories = Category.all
		@category = Category.find(params[:category]) if params[:category].present?
	end
end
