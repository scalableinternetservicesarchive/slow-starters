class MessagesController < ApplicationController
  before_action :find_listing
  
  def index
    @messages = @listing.messages
    @message = @listing.messages.new
  end
  
  def create
    @message = @listing.messages.new(message_params)
    if @message.save
      redirect_to listing_path(@listing)
    end
  end
  
  def new
    @message = @listing.messages.new
  end
  
  private
  
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
  
    def find_listing
      @listing = Listing.find(params[:listing_id])
    end
    
end