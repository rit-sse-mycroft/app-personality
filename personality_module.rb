require 'yaml'

module PersonalityModule

  SAYINGS = YAML.load_file('sayings.yml')

  def response_for(trigger)
    @SAYINGS.detect {|saying| saying['trigger'] == trigger}
  end

  # Sends a message to tts
  def tts(text)
    content = {text: text, targetSpeaker: "speakers"}
    query('tts', 'stream', content)
  end

end
