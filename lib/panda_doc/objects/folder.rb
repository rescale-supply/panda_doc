# frozen_string_literal: true

module PandaDoc
  module Objects
    class Folder < Base
      attribute :uuid, Types::Coercible::String
      attribute :name, Types::Coercible::String
      attribute? :parent_uuid, Types::Coercible::String.optional
    end
  end
end
