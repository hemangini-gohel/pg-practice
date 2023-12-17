class Product < ApplicationRecord
  trigger.after(:delete) do
    "INSERT INTO `removed_animals` (`id`, `name`) VALUES (OLD.`id`, OLD.`name`)"
  end
end
