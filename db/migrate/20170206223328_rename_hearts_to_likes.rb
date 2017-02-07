class RenameHeartsToLikes < ActiveRecord::Migration
  def change
    rename_table :hearts, :likes
  end 
end
