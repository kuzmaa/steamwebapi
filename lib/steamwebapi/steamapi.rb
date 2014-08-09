require 'net/http'
require 'json'

module SteamAPI
  def self.get(interface, method, version, args = {})
    json = true
    if args.empty?
      raise 'Error: cannot retrieve data without arguments'
    else
      i = ''
      args.each do |key, value|
        # the first key needs ? in front of it
        if key == args.keys[0]
          i += "?#{key}=#{value}"
        else
          i += "&#{key}=#{value}"
        end
      end
      domain = "http://api.steampowered.com/#{interface}/#{method}/#{version}/#{i}"
    end
    uri = Net::HTTP.get(URI(domain))
    if json
      JSON.parse(uri)
    else
      raise 'data not in JSON format'
    end
  end
end
