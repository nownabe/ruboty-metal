require "active_support/core_ext/object/try"

module Ruboty
  module Handlers
    class Metal < Base
      WORDS = [
        "ALL RIGHT!!!",
        "RIDE THE SKY!!!",
        "RIGHT NOW!!!",
        "MURDERER!!!"
      ]

      SUFFIX = {
        "Ruboty::Adapters::Slack" => ":metal:",
        "Ruboty::Adapters::Hipchat" => "(metal)"
      }

      on /metal\z/i, name: "say", description: "Return a metal word."

      def say(message)
        message.reply(WORDS.sample + suffix)
      end

      private

      def suffix
        SUFFIX[Ruboty::AdapterBuilder.adapter_classes.last.to_s].try(:insert, 0, " ").to_s
      end
    end
  end
end

