module Dropbox
  module API

    class Error < StandardError

      class BadInput < Error; end
      class ConnectionFailed < Error; end
      class Config < Error; end
      class Unauthorized < Error; end
      class Forbidden < Error; end
      class NotFound < Error; end
      class Redirect < Error; end
      class WrongMethod < Error; end
      class RateLimit < Error; end
      class StorageQuota < Error; end

    end

  end
end
