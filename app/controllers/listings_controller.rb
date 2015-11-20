class ListingsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :show, :edit, :update, :destroy]

	def new
		@listing = current_user.listings.build if signed_in?
	end

	def create
		@listing = current_user.listings.build(listing_params)
	    if @listing.save
	      flash[:success] = "Created new Listing!"
	      redirect_to @current_user
	    else
	      render 'new'
	    end
	end

	def show
		@listing = Listing.find(params[:id])
		@user = User.find_by_id(@listing.user_id)
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
	    if @listing.update_attributes(listing_params)
	      flash[:success] = "Listing updated"
	      redirect_to @current_user
	    else
	      render 'edit'
	    end
	end

	def destroy
		Listing.find(params[:id]).destroy 
		flash[:success] = "Listing Deleted"
		redirect_to @current_user
	end

	private

		def listing_params
			params.require(:listing).permit(:name, :producttype, :subcategory, :category, :price, :photo)
		end
end
