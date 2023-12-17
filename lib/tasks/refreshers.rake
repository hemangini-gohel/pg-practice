namespace :refreshers do
  desc "Refresh materialized view"
  task users_with_maddress: :environment do
    UsersWithMaddress.refresh
  end
end
