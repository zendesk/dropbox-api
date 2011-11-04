module Dropbox
  module API

    class Client

      module Files

        def download(path, options = {})
          root     = options.delete(:root) || Dropbox::API::Config.mode
          url      = ['', "files", root, path].compact.join('/')
          connection.get_raw(:content, url)
        end

        def upload(path, data, options = {})
          root     = options.delete(:root) || Dropbox::API::Config.mode
          query    = Dropbox::API::Util.query(options)
          url      = ['', "files_put", root, path].compact.join('/')
          response = connection.put(:content, "#{url}?#{query}", data, {
            'Content-Type'   => "application/octet-stream",
            "Content-Length" => data.length.to_s
          })
          Dropbox::API::File.init(response, self)
        end

      end

    end

  end
end

