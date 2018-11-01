class User < ActiveRecord::Base
    def checked_id=(checked_id)
        checked_id.reject(&:blank?)
    end
end
