require 'srgs'
require 'yaml'

module PersonalityGrammar
  include Srgs::DSL

  extend self

  sayings = YAML.load_file('sayings.yml')

  grammar 'personality' do
    public_rule 'personality' do
      one_of do
        sayings.each do |saying|
          item saying["trigger"]
        end
      end
    end
  end

end