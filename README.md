Steam web API
===

[![Gem Version](https://badge.fury.io/rb/steamwebapi.svg)](http://badge.fury.io/rb/steamwebapi)

Steam Web API library in Ruby. Retrieves and parses JSON data. If you want more information about the API go to:

* http://steamcommunity.com/dev
* https://developer.valvesoftware.com/wiki/Steam_Web_API


## TODO

* add a SteamID64 converter thingamajig so you don't have to use a user's SteamID64 only.

## Installation

Open up your terminal or cmd or whatever and copypasta this code

    gem install steamwebapi

To use it in your application, add the following to your Gemfile:

    gem 'steamwebapi', '~> 1.0.0'

## Usage

Retrieve a user's friend list:

    # retrieve friend list of user with SteamID64 being 76561197960435530
    SteamUser.key('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').friend_list('76561197960435530') # some functions require an api key(IPlayerService, ISteamUser, and some ISteamUserStats)

Retrieve news for a Steam app:

    # retrieve news for Steam app
    SteamApp.get_news('440', '1', '1') # this will retrieve 1 article of app 440 with the content's length being 1("A...")

You can also use the SteamAPI module's `get` function

    # return news for a Steam app - this does the same thing as the example above, its just messier(IMO)
    SteamAPI.get('ISteamNews', 'GetNewsForApp', 'v0002', args = {appid: '440', count: '1', maxlength: '1'})