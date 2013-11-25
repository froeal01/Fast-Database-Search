desc "TODO"
task :sum_karma => :environment do 
  User.pluck(:id).each_slice(1000) do |ids|
    User.where(:id => ids).includes(:karma_points).each do |user|
      user.karma_total = user.total_karma
      user.save(validate: false)
      print "."
    end
  end
end
