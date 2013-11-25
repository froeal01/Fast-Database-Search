class AddIndexUserIdToKarmaPoints < ActiveRecord::Migration
  def change
    add_index :karma_points, :user_id, { order: { user_id: :asc } }
  end
end


