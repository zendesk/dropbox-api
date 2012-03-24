module Dropbox
  module API

    module Util

      class << self

        def escape(string)
          string.gsub(/([^ a-zA-Z0-9\.\\\-\/\_]+)/) do
            '%' + $1.unpack('H2' * $1.bytesize).join('%').upcase
          end.gsub(' ', '%20')
        end

        def query(data)
          data.inject([]) { |memo, entry| memo.push(entry.join('=')); memo }.join('&')
        end

      end

    end

  end
end
