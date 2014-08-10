# encoding: UTF-8
require_relative 'steamapi'

module SteamApp
  # ISteamNews
  def self.get_news(appid, count='1', maxlength=nil)
    args = {appid: appid, count: count, maxlength: maxlength}
    SteamAPI.get('ISteamNews', 'GetNewsForApp', 'v0002', args)
  end
end