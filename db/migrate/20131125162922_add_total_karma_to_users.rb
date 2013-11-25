class AddTotalKarmaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :karma_total, :integer, default: 0
  end
end
