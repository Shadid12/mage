class MessagesController < ApplicationController
    def create
        @message = Message.create(message_params)
        @message.save
    end
    
    private
    
    def message_params
        params.permit(:crecit_id, :user_id, :body)
    end
end
