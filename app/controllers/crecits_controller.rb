class CrecitsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @crecit = Crecit.new
    end
    
    def create
        @crecit = current_user.crecits.new(crecit_params)
        respond_to do |format|
          if @crecit.save
            format.html { redirect_to @crecit, notice: 'Request Sent' }
          else
            format.html { redirect_to listings_path, notice: 'your request can not be sent' }
          end
        end
    end
    
    def show
    end
    
    private 
    
    def crecit_params
      params.permit(:user_id, :status, :message, :listing_id)
    end
    
end
