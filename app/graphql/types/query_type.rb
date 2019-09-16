module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :all_users, [Types::UserType], null: false,
      description: "An example field added by the generator"

    field :user, Types::UserType, null: true do
      argument :id, String, required: true
    end

    field :all_books, [Types::BookType], null: false, description: "List all the books"

    def all_books
      Book.all
    end

    def user(id:)
      User.find(id)
    end
    
    def all_users
      User.all
    end
  end
end
