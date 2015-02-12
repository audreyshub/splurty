class QuotesController < ApplicationController
	def index
		@quote = Quote.order("RANDOM()").first
	end

	

	def create
		@quote = Quote.create(quote_params)
		if @quote.invalid?
			flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
		end
		if @quote.invalid?
			redirect_to root_path
		else
			
			redirect_to quote_path :id => @quote.id
		end
	end

	def about
	end

	def show
		@quote = Quote.where(:id => params[:id]).first
		if @quote.blank?
			render :text => "Not Found", :status => :not_found
		end
	end

	private

	def quote_params
		params.require(:quote).permit(:saying, :author)
	end
end
