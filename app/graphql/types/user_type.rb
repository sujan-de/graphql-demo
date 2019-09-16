class Types::UserType < Types::BaseObject
  field :id, ID, null: false
  field :email, String, null: true
  field :name, String, null: false
  field :books, [Types::BookType], null: true

  def books
    object.books.all
  end 
end
