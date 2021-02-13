require 'dry-struct'

module Types
  include Dry.Types()

  ChoresDate = Types.Constructor(Types::Params::Date.optional) do
    _1 || ::Date.today
  end
end
