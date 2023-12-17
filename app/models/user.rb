class User < ApplicationRecord
  has_many :addresses
  scope :with_address, -> { joins(:addresses) } # inner join
  # left outer join
  scope :with_address_left_outer_join, -> { left_outer_joins(:addresses) }

  # right outer join - not directly supported in rails
  def self.with_address_right_outer_join
    find_by_sql("
      SELECT *
      FROM addresses
      RIGHT JOIN users ON addresses.user_id = users.id
    ")
  end
end
