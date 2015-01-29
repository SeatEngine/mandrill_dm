module MandrillDm
  class DeliveryMethod
    attr_accessor :settings

    def initialize(options = {})
      self.settings = options.reverse_merge!(return_result: true)
    end

    def deliver!(mail)
      mandrill = Mandrill::API.new(MandrillDm.configuration.api_key)
      message = Message.new(mail).to_json
      result = mandrill.messages.send(message)
    end
  end
end
