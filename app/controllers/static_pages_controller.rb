class StaticPagesController < ApplicationController
  def home
	@messages = current_user.messages.build if signed_in?  	
  end

  def about
  end

  def contact
  end
end
