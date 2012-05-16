class CreateAddTranslatingReportColumnsToComments < ActiveRecord::Migration
  def change

add_column :comments, :translating, :String
    add_column :comments, :report, :boolean

  end
end
