require 'mycroft'
require_relative './personality_module'

class Personality < Mycroft::Client
  include PersonalityModule
  attr_accessor :verified

  def initialize(host, port)
    @key = ''
    @cert = ''
    @manifest = './app.json'
    @verified = false
    @sent_grammar = false
    @dependencies = {}
    super
  end

  on 'MSG_BROADCAST' do |data|
    trigger = data['content']['text']
    resp = response_for(trigger)
    tts(resp)
  end

  on 'APP_DEPENDENCY' do |data|
    update_dependencies(data)
    if not @dependencies['stt'].nil?
      if @dependencies['stt']['stt1'] == 'up' and not @sent_grammar
        up
        data = {grammar: { name: 'personality', xml: File.read('./grammar.xml')}}
        query('stt', 'load_grammar', data)
        @sent_grammar = true
      elsif @dependencies['stt']['stt1'] == 'down' and @sent_grammar
        @sent_grammar = false
        down
      end
    end
  end

  # Handler for disconnect
  on 'end' do
    query('stt', 'unload_grammar', {grammar: 'joke'})
  end

end

Mycroft.start(Personality)
