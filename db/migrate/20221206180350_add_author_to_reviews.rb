class AddAuthorToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :author, :string
  end
end
