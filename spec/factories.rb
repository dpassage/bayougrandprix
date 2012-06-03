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
  factory :season_entry do
    season
    driver
    association :defaultteam, factory: :team
  end
  factory :track do
    name "Embarcadero"
    country "California"
  end
  factory :race do
    date "2012-04-01"
    track
    season
  end
  factory :race_entry do
    race
    season_entry
    team
    finish nil
    qualify nil
  end
end
