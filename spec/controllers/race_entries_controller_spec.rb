require 'spec_helper'

describe RaceEntriesController, type: :controller do
  let(:season) { FactoryGirl.create(:season) }
  let(:race) { FactoryGirl.create(:race, season: season) }
  let(:driver_entry) { FactoryGirl.create(:driver_entry, season: season) }
  let(:team) { FactoryGirl.create(:team) }
  let(:race_entry_params) do
    { 'race_entry' => { driver_entry_id: driver_entry.to_param,
                        race_id: race.to_param,
                        team_id: team.to_param },
      'season_id' => season.to_param,
      'race_id' => race.to_param
    }
  end

  describe "POST 'create'" do
    context 'when the user is not an admin' do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          post 'create', race_entry_params
        end
      end
      it 'does not create the race entry' do
        expect do
          post 'create', race_entry_params
        end.to change(RaceEntry, :count).by(0)
      end
    end
    context 'when the user is an admin' do
      before(:each) do
        user_is_admin
      end
      it 'adds a driver to the race' do
        expect do
          post 'create', race_entry_params
        end.to change(RaceEntry, :count).by(1)
      end
      it 'redirects to the race edit page' do
        post 'create', race_entry_params
        expect(response).to redirect_to(
          edit_season_race_path(driver_entry.season,
                                race)
        )
      end
      it 'sets the flash notice' do
        post 'create', race_entry_params
        expect(flash[:notice]).not_to be_nil
      end
    end
  end
end
