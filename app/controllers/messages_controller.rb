class MessagesController < ApplicationController
	before_action :signed_in_user, only: [:show, :create, :destroy]
#	before_action :correct_user,   only: :destroy
	def index

	end

	def create
		@messages = current_user.messages.build(message_params)
	    if @messages.save
	      flash[:success] = "Message sent!"
	      redirect_to current_user
	    else
	    	@feed_items = []
	        redirect_to root_url
	    end
	  end

	def destroy
		@messages = Message.find(params[:id])
    	if @messages.present?
      		@messages.destroy
    		redirect_to current_user
    	end
    end

	  private

    	def message_params
	      	params.require(:message).permit(:Body, :ToUserId, :FromUserId, :SubjectTitle)
    	end

		def correct_user
	      @messages = current_user.messages.find_by(id: params[:id])
	      redirect_to root_url if @messages.nil?
	    end    	
end