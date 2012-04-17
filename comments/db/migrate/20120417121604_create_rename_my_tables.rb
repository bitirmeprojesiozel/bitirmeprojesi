class CreateRenameMyTables < ActiveRecord::Migration
  def change


      rename_column :comments, :comment, :message



  end
end
