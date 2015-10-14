class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      t.index [:user_id, :created_at] #L7.8 add
    end
  end
end
