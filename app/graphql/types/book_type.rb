class Types::BookType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: true
  field :user, Types::UserType, null: false
end
