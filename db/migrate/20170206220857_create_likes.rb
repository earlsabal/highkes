class CreateLikes < ActiveRecord::Migration
  create_table :hearts do |t|
    t.belongs_to :post, index: true
    t.belongs_to :user, index: true
    t.timestamps null: false
  end
end
