class User < ActiveRecord::Base
  has_many :karma_points do
    def total
      self.reduce(0) do |acc, kp|
        acc = kp.value
      end
    end
  end

  attr_accessible :first_name, :last_name, :email, :username

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    order("karma_total DESC")
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
  end

  def total_karma
    self.karma_points.total
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
