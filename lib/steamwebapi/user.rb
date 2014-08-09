require_relative 'steamapi'

module SteamUser
  def self.key(key)
    @key = key
    self
  end

  ## ISteamUser
  def self.summaries(steamids=[])
    args = {key: @key}

    unless steamids.empty?
      ids = ''
      steamids.each do |id|
        ids += "#{id},"
      end
      args[:steamids] = ids
    end

    SteamAPI.get('ISteamUser', 'GetPlayerSummaries', 'v0002', args)
  end

  def self.friend_list(steamid, relationship='friend')
    args = {key: @key, steamid: steamid, relationship: relationship}
    SteamAPI.get('ISteamUser', 'GetFriendList', 'v0001', args)
  end

  ## ISteamUserStats
  def self.global_achievements_percent(gameid)
    args = {gameid: gameid}
    SteamAPI.get('ISteamUserStats', 'GetGlobalAchievementPercentagesForApp', 'v0002', args)
  end

  def self.global_stats(appid, count='1', name=[])
    args = {appid: appid, count: count}

    name.each do |v|
      args.merge!("name[#{name.index(v)}]" => v)
    end

    SteamAPI.get('ISteamUserStats', 'GetGlobalStatsForGame', 'v0001', args)
  end

  def self.player_achievements(steamid, appid, language='english')
    args = {key: @key, steamid: steamid, appid: appid, l: language}
    SteamAPI.get('ISteamUserStats', 'GetPlayerAchievements', 'v0001', args)
  end

  def self.user_stats_for_game(steamid, appid, language='english')
    args = {key: @key, steamid: steamid, appid: appid, l: language}
    SteamAPI.get('ISteamUserStats', 'GetUserStatsForGame', 'v0002', args)
  end

  ## IPlayerService
  def self.owned_games(steamid, appinfo=false, freegames=false)
    args = {key: @key, steamid: steamid}

    if appinfo
      args[:include_appinfo] = '1'
    else
      args[:include_appinfo] = '0'
    end

    if freegames
      args[:include_played_free_games] = '1'
    else
      args[:include_played_free_games] = '0'
    end

    SteamAPI.get('IPlayerService', 'GetOwnedGames', 'v0001', args)
  end

  def self.recently_played(steamid, count='1')
    args = {key: @key, steamid: steamid, count: count}
    SteamAPI.get('IPlayerService', 'GetRecentlyPlayedGames', 'v0001', args)
  end

  def self.is_playing_shared(steamid, appid)
    args = {key: @key, steamid: steamid, appid_playing: appid}
    SteamAPI.get('IPlayerService', 'IsPlayingSharedGame', 'v0001', args)
  end
end