#
# Author:: Jay Mundrawala (<jdm@chef.io>)
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "uri"

class Chef
  module Mixin
    module Uris
      # uri_scheme? returns true if the string starts with
      # scheme://
      # For example, it will match http://foo.bar.com
      def uri_scheme?(source)
        # From open-uri
        !!(%r{\A[A-Za-z][A-Za-z0-9+\-\.]*://} =~ source)
      end


      def as_uri(source)
        begin
          URI.parse(source)
        rescue URI::InvalidURIError
          Chef::Log.warn("#{source} was an invalid URI. Trying to escape invalid characters")
          URI.parse(URI.escape(source))
        end
      end

    end
  end
end
