class HomeController < ApplicationController

  def index
  end

  def go_chatting
    all_message = Message.all

    @message_sent = all_message.where(:sender_id => current_user.id)
    @message_received = all_message.where(:receiver_id => current_user.id)
  end

  def new_chat
    @all_users = User.all
  end

  def send_new_chat
    new_message = Message.new
    new_message.sender_id = current_user.id
    new_message.receiver_id = params[:receiver]
    new_message.content = params[:content]

    new_message.save

    redirect_to go_chatting_path
  end

end
