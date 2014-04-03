require 'yaml'

module PersonalityModule

  SAYINGS = YAML.load_file('sayings.yml')

  def response_for(trigger)
    SAYINGS.find {|saying| saying['trigger'] == trigger}['responses'].sample
  end

  # Sends a message to tts
  def tts(text)
    content = {text: [ {phrase: text, delay: 0} ], targetSpeaker: "speakers"}
    query('tts', 'stream', content)
  end

end
