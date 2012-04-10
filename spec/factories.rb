FactoryGirl.define do
  factory :scoring_scheme do
    name "9-6-4-3-2-1"
  end
  factory :season do
    sequence (:name) { |n| "Season #{n}" }
    scoring_scheme
  end
  factory :player do
    name "Player Name"
  end
  factory :driver do
    name "Driver Name"
    player
  end
  factory :team do
    name "Team Name"
    color Team::Colors["White"]
  end
end