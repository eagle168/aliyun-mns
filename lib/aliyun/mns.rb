require 'active_support/core_ext'
require 'rest-client'
require 'nokogiri'
require 'yaml'
require 'aliyun/mns/version'
# RestClient.log=STDOUT

# Monkey patch hash to support xml array and xml object
class Hash
  def self.xml_array content, *path
    o = xml_object(content, *path)
    return (o.is_a?(Array) ? o : [o]).reject{|n| n.empty?}
  end

  def self.xml_object content, *path
    h = from_xml(content)
    path.reduce(h){|memo, node|  memo = memo[node] || {}}
  end
end

module Aliyun
  module Mns
    require 'aliyun/mns/queue'
    require 'aliyun/mns/message'
    require 'aliyun/mns/batch_message'
    require 'aliyun/mns/request'
    require 'aliyun/mns/cli'

    class << self
      def configuration
        @configuration ||=  begin
          OpenStruct.new({access_id:ENV['OSS_ACCESS_ID'], key:ENV['OSS_ACCESS_KEY'], host:ENV['MNS_HOST']})
        end
      end

      def configure
        yield(configuration)
      end
    end

  end
end
