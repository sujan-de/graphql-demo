class Types::UserType < Types::BaseObject
  field :email, String, null: true
  field :name, String, null: false
end
