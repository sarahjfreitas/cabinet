class AddUserToDocs < ActiveRecord::Migration[5.2]
  def change
    add_reference :docs, :user, foreign_key: true
  end
end
