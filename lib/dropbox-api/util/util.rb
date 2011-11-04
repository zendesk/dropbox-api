module Dropbox
  module API

    module Util

      class << self

        def query(data)
          data.inject([]) { |memo, entry| memo.push(entry.join('=')); memo }.join('&')
        end

      end

    end

  end
end
