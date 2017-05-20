# Scaffolding generated by Casein v5.2.0.0

module Casein
  class InboxesController < Casein::CaseinController
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_action :needs_admin, except: [:action1, :action2]
    # before_action :needs_admin_or_current_user, only: [:action1, :action2]
  
    def index
      @casein_page_title = 'Inboxes'
      @inboxes = Inbox.order(sort_order(:shortmessage)).paginate page: params[:page]
    end

    def show
      @casein_page_title = 'View inbox'
      @inbox = Inbox.find params[:id]
      @inbox.read = 0
      @inbox.save
      @url = @inbox.shortmessage
    end

    def new
      @url = Link.find(params[:url]).display_slug
      @casein_page_title = 'Add a new inbox'
      @inbox = Inbox.new
    end

    def create
      @inbox = Inbox.new inbox_params
      @inbox.sender = current_user.id

      if @inbox.save
        flash[:notice] = 'Inbox created'
        redirect_to casein_inboxes_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new inbox'
        render action: :new
      end
    end

    def update
      @casein_page_title = 'Update inbox'

      @inbox = Inbox.find params[:id]

      if @inbox.update_attributes inbox_params
        flash[:notice] = 'Inbox has been updated'
        redirect_to casein_inboxes_path
      else
        flash.now[:warning] = 'There were problems when trying to update this inbox'
        render action: :show
      end
    end

    def destroy
      @inbox = Inbox.find params[:id]

      @inbox.destroy
      flash[:notice] = 'Inbox has been deleted'
      redirect_to casein_inboxes_path
    end

    private

    def inbox_params
      params.require(:inbox).permit(:shortmessage, :sender, :reseiver, :read, :url)
    end
  end
end
