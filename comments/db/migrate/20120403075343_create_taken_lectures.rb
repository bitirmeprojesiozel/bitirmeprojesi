class CreateTakenLectures < ActiveRecord::Migration
  def change
    create_table :taken_lectures do |t|

      t.integer :user_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
