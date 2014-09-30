module NotificationMailers
  class Liked < NotificationMailers::Base
    attr_accessor :like
    delegate :target, to: :like, prefix: true

    def set_headers(like_id)
      @like = Like.find(like_id)

      @headers[:subject] = "[#{AppConfig.settings.pod_name}] You've got liked"
    end
  end
end
