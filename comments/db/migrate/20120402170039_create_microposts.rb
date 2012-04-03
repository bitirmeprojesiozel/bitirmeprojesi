class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|

      t.timestamps
    end
  end
end
