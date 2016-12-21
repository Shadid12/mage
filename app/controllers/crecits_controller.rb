class CrecitsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @crecit = Crecit.new
    end
    
    def create
        k = Crecit.find_by(search_params)
        puts k
        if k.nil?
            @crecit = Crecit.create(crecit_params)
            if @crecit.save
                @message = @crecit.messages.build(message_params)
                @message.user_id = current_user.id
                if @message.save
                    redirect_to crecit_path(@crecit)
                else
                    redirect_to root_path
                end
            else
                redirect_to root_path
            end
        else
            @crecit = k
            @message = @crecit.messages.build(message_params)
            @message.user_id = current_user.id
            if @message.save
                redirect_to crecit_path(@crecit)
            else
                redirect_to root_path
            end
        end
    end
    
    def show
        @crecit = Crecit.find(params[:id])
        @messages = @crecit.messages.all
    end
    
    def index
        @h = Crecit.where(host_id: current_user.id)
        @c = Crecit.where(cleaner_id: current_user.id)
    end
    
    def approve
        @crecit = Crecit.find_by(search_params)
        if @crecit.host_id == current_user.id
            @crecit.status = "approved"
            @crecit.save
            redirect_to crecits_path
        end
    end
    
    private 
    
    def crecit_params
      params.permit(:cleaner_id, :host_id, :listing_id, :status)
    end
    
    def message_params
        params.permit(:body)
    end
    
    def search_params
        params.permit(:cleaner_id, :host_id, :listing_id)
    end
    
end
