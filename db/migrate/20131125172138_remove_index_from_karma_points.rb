class RemoveIndexFromKarmaPoints < ActiveRecord::Migration
 def change
  remove_index :karma_points, :user_id
end
end
