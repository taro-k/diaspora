module NotificationMailers
  class Reshared < NotificationMailers::Base
    attr_accessor :reshare
    
    delegate :root, to: :reshare, prefix: true

    def set_headers(reshare_id)
      @reshare = Reshare.find(reshare_id)

      @headers[:subject] = "[#{AppConfig.settings.pod_name}] Your post has been reshared"
    end
  end
end
