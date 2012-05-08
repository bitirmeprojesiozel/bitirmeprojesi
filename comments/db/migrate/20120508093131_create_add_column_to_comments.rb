class CreateAddColumnToComments < ActiveRecord::Migration
  def change

    add_column :comments, :hiding, :boolean

  end
end
