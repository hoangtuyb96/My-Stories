module Serializers
  module Users
    class UserMinForClonerSerializer < Serializers::SupportSerializer
      attrs :id, :email, :avatar

      delegate :id, to: :object
    end
  end
end
