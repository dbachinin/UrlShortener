class RedirectUrlController < ApplicationController
	  def index
      @links = Link.new
    	if params[:slug]
      		@link = Link.find_by(slug: params[:slug])
      	if redirect_to @link.given_url
        	@link.save
      	end
    	else
       @link = Link.find(params[:id])
    end
  end
end
