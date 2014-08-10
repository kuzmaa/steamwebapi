# encoding: UTF-8
require 'net/http'
require 'json'
require 'rexml/document'

module SteamAPI
  def self.get(interface, method, version, args = {})
    if args.empty?
      raise 'cannot retrieve data without arguments'
    else
      i = ''
      args.each do |key, value|
        # the first argument needs ? in front of it
        if key == args.keys[0]
          i += "?#{key}=#{value}"
        else
          i += "&#{key}=#{value}"
        end
      end
      domain = "http://api.steampowered.com/#{interface}/#{method}/#{version}/#{i}"
    end
    uri = Net::HTTP.get(URI(domain))
    case args.key('format')
    when 'xml'
      uri
    when 'vdf'
      uri
    else
      JSON.parse(uri)
    end
  end
end