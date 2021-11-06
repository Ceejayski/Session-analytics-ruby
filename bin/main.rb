#!/usr/bin/env ruby

require_relative '../lib/get_user_session'

json = {
  "events": [
    {
      "url": '/pages/a-big-river',
      "visitorId": 'd1177368-2310-11e8-9e2a-9b860a0d9039',
      "timestamp": 1_512_754_583_000
    },
    {
      "url": '/pages/a-small-dog',
      "visitorId": 'd1177368-2310-11e8-9e2a-9b860a0d9039',
      "timestamp": 1_512_754_631_000
    },
    {
      "url": '/pages/a-big-talk',
      "visitorId": 'f877b96c-9969-4abc-bbe2-54b17d030f8b',
      "timestamp": 1_512_709_065_294
    },
    {
      "url": '/pages/a-sad-story',
      "visitorId": 'f877b96c-9969-4abc-bbe2-54b17d030f8b',
      "timestamp": 1_512_711_000_000
    },
    {
      "url": '/pages/a-big-river',
      "visitorId": 'd1177368-2310-11e8-9e2a-9b860a0d9039',
      "timestamp": 1_512_754_436_000
    },
    {
      "url": '/pages/a-sad-story',
      "visitorId": 'f877b96c-9969-4abc-bbe2-54b17d030f8b',
      "timestamp": 1_512_709_024_000
    }
  ]
}

session = GetUserSession.new(json)
session.set_session
result = session.session_by_user

puts result
