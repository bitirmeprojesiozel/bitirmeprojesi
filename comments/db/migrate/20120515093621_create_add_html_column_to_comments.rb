class CreateAddHtmlColumnToComments < ActiveRecord::Migration
  def change

    add_column :comments, :body_html, :String

  end
end
