#!/usr/bin/env ruby

class GetUserSession
  attr_accessor :events, :user_events, :session_by_user

  def initialize(json)
    @events = json[:events]
    @session_by_user = {}
    @user_events = @events.group_by { |x| x[:visitorId] }
  end

  def set_session
    @user_events.each do |user, events|
      user_events_arr = events.sort_by { |h| h[:timestamp] }
      @session_by_user[user] = set_user_session(user_events_arr)
    end
  end

  def set_user_session(arr)
    i = 0
    session = []
    session << { duration: 0, pages: [arr[0][:url]], startTime: arr[0][:timestamp] }
    (1...arr.size).each do |j|
      if (arr[j][:timestamp] - arr[i][:timestamp]) <= 60_000
        session.last[:duration] = session.last[:duration] + (arr[j][:timestamp] - arr[i][:timestamp])
        session.last[:pages] << arr[j][:url]
        session.last[:startTime] = arr[i][:timestamp]
      else
        session << { duration: 0, pages: [arr[j][:url]], startTime: arr[j][:timestamp] }
      end
      i = j
    end
    session
  end
end
