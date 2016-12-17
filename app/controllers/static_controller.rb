class StaticController < ApplicationController
    def index
    end
    
    def cleaning
    end
    
    def update_user_location
        u = current_user
        u.latitude = params[:latitude]
        u.longitude = params[:longitude]
        u.save
        redirect_to cleaning_list_path
    end
    
    def cleaning_list
        
        if params[:radius].present?
            @near = Listing.near([current_user.latitude,current_user.longitude],params[:radius], :unit => :km)
        else
            @near = Listing.all
        end
        
    end
    
end
