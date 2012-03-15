
FactoryGirl.define do
  factory :galaxy, :class => Refinery::Galaxies::Galaxy do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

