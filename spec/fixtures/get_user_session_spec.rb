require_relative '../../lib/get_user_session'
describe 'Get user session' do
  let(:json) do
    {
      "events": [
        {
          "url": '/pages/a-big-river',
          "visitorId": 'd1177368-2310-11e8-9e2a-9b860a0d9039',
          "timestamp": 1_512_754_587_000
        },
        {
          "url": '/pages/test',
          "visitorId": 'd1177368-2310-11e8-9e2a-9b860a0d9039',
          "timestamp": 1_512_754_638_000
        },
        {
          "url": '/pages/a-big-talk',
          "visitorId": 'f877b96c-9969-4abc-bbe2-54b17d030f8b',
          "timestamp": 1_512_709_065_294
        },
        {
          "url": '/pages/a-sad-story',
          "visitorId": 'f877b96c-9969-4abc-bbe2-54b17d030f8b',
          "timestamp": 1_512_711_007_000
        },
        {
          "url": '/pages/a-big-river',
          "visitorId": 'd1177368-2310-11e8-9e2a-9b860a0d9039',
          "timestamp": 1_512_754_439_000
        },
        {
          "url": '/pages/a-sad-story',
          "visitorId": 'f877b96c-9969-4abc-bbe2-54b17d030f8b',
          "timestamp": 1_512_709_024_000
        }
      ]
    }
  end

  subject { GetUserSession.new(json) }
  it 'should check if user_events is present' do
    test = subject.events.group_by { |x| x[:visitorId] }
    expect(subject.user_events).to eq(test)
  end

  it 'should check if session by user is valid' do
    subject.set_session
    test = [{ duration: 0, pages: ['/pages/a-big-river'], startTime: 1_512_754_439_000 },
            { duration: 51_000, pages: ['/pages/a-big-river', '/pages/test'], startTime: 1_512_754_587_000 }]
    expect(subject.session_by_user['d1177368-2310-11e8-9e2a-9b860a0d9039']).to eq(test)
  end
end
