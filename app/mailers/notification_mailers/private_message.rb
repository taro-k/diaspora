module NotificationMailers
  class PrivateMessage < NotificationMailers::Base
    attr_accessor :message, :conversation, :participants

    def set_headers(message_id)
      @message  = Message.find_by_id(message_id)
      @conversation = @message.conversation
      @participants = @conversation.participants

      @headers[:from] = "\"#{AppConfig.mail.sender_address}\" <#{AppConfig.mail.sender_address}>"
      @headers[:subject] = "[Diaspora-Japan] You've got a message"
      @headers[:subject] = "[Diaspora-Japan] You've got a reply message" if @conversation.messages.size > 1
    end
  end
end
