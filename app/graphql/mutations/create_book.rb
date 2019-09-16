class Mutations::CreateBook < Mutations::BaseMutation

  argument :title, String, required: true
  argument :email, String, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false
  field :id, String, null: false
  field :title, String, null: false

  def resolve(title:, email:)
    user = User.find_by(email: email)
    if book = Book.create(title: title, user: user)
      # Successful creation, return the created object with no errors
      id = book.id
      title = book.title
      {
        id: id,
        title: title,
        user: user,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        user: nil,
        errors: book.errors.full_messages
      }
    end
  end
end
