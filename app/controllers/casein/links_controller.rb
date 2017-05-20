# Scaffolding generated by Casein v5.2.0.0

module Casein
  class LinksController < Casein::CaseinController
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_action :needs_admin, except: [:action1, :action2]
    before_action :needs_admin_or_current_user, except: [:index, :new, :create, :update, :destr]
  
    def index
      @casein_page_title = 'Links'
      @links = Link.order(sort_order(:given_url)).paginate page: params[:page]
    end

  def show
    if params[:slug]
      @link = Link.find_by(slug: params[:slug])
      if redirect_to @link.given_url
        @link.save
      end
    else
      @link = Link.find(params[:id])
    end
  end


    def new
      @casein_page_title = 'NEW Short'
      @link = Link.new
      Link.all.each {|i| i.destroy if Time.now.to_i - i.created_at.to_i >= 1296000 }
    end

    def create
      @link = Link.new link_params
      @link.casein_admin_users_id = current_user.id
      if @link.save
        flash[:notice] = 'You URL shorten!'
        redirect_to casein_links_path
      else
        flash.now[:warning] = 'There were problems when trying to short you link'
        render action: :new
      end
    end

    def update
      @casein_page_title = 'Update link'

      @link = Link.find params[:id]

      if @link.update_attributes link_params
        flash[:notice] = 'Link has been updated'
        redirect_to casein_links_path
      else
        flash.now[:warning] = 'There were problems when trying to update this link'
        render action: :show
      end
    end

    def destroy
      @link = Link.find params[:id]

      @link.destroy
      flash[:notice] = 'Link has been deleted'
      redirect_to casein_links_path
    end

    private

    def link_params
      params.require(:link).permit(:given_url, :slug, :title,)
    end
  end
end