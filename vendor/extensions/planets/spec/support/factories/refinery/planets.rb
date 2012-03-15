
FactoryGirl.define do
  factory :planet, :class => Refinery::Planets::Planet do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

