require 'spec_helper'
# Processing by RacesController#create as HTML
#   Parameters: {'utf8'=>'',
#     'authenticity_token'=>'ukzMw26fDREoMvVYpPKXt2zvtU2UU2b3+6PHNy986/k=',
#     'season_id'=>'2011', 'date'=>{'year'=>'2012', 'month'=>'4', 'day'=>'10'},
#     'race'=>{'track_id'=>'33'}, 'commit'=>'Add Race'}
# Completed 500 Internal Server Error in 3ms

describe RacesController, type: :controller do
  let(:season) { FactoryGirl.create(:season) }
  let(:track) { FactoryGirl.create(:track) }
  describe 'POST create' do
    let(:create_params) do
      { season_id: season.to_param,
        race: {
          'date(1i)' => '2012',
          'date(2i)' => '4',
          'date(3i)' => '11',
          'track_id' => track.id
      } }
    end
    let(:invalid_params) { { 'season_id' => season.to_param, 'race' => {} } }

    context 'when the user is not an admin' do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          post 'create', create_params
        end
      end
      it 'does not create the race' do
        expect do
          post 'create', create_params
        end.to change(Race, :count).by(0)
      end
    end
    context 'when the user is an admin' do
      before(:each) do
        user_is_admin
      end
      it_should_behave_like 'standard create CRUD' do
        let(:klass) { Race }
        let(:redirect_path) { season_path(season) }
      end
      describe 'with invalid parameters' do
        it 'renders the new template' do
          post 'create', invalid_params
          expect(response).to redirect_to(season_path(season))
        end
      end
      it 'adds a race to the season' do
        expect do
          post 'create', create_params
        end.to change(season.races, :count).by(1)
      end
      it 'redirects to the season page' do
        post 'create', create_params
        expect(response).to redirect_to(season_path(season))
      end
      it 'sets the flash notice' do
        post 'create', create_params
        expect(flash[:notice]).not_to be_nil
      end
    end
  end
  describe 'GET show' do
    let(:race) { FactoryGirl.create(:race, season: season) }
    let(:params) do
      { 'season_id' => season.to_param,
        'id' => race.to_param }
    end
    it 'passes the race' do
      get 'show', params
      expect(assigns[:race]).to eq(race)
    end
    it 'passes the season' do
      get 'show', params
      expect(assigns[:season]).to eq(season)
    end
  end
  describe 'GET edit' do
    let(:race) { FactoryGirl.create(:race, season: season) }
    let(:params) do
      { 'season_id' => season.to_param,
        'id' => race.to_param }
    end
    it 'passes the race' do
      get 'edit', params
      expect(assigns[:race]).to eq(race)
    end
    it 'passes the season' do
      get 'edit', params
      expect(assigns[:season]).to eq(season)
    end
  end
  describe 'POST update' do
    let(:race) { FactoryGirl.create(:race) }
    context 'when the user is not an admin' do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          post 'update', id: race.to_param, season_id: season.to_param
        end
      end
    end
    context 'when the user is an admin' do
      before(:each) do
        user_is_admin
      end
      context 'setting the qualifying and finishing' do
        let(:re1) { FactoryGirl.create(:race_entry, race: race) }
        let(:re2) { FactoryGirl.create(:race_entry, race: race) }
        let(:re3) { FactoryGirl.create(:race_entry, race: race) }
        context 'finishing places are unique' do
          let(:params) do
            { 'race' =>
              { 'race_entries_attributes' =>
                { '0' => { 'finish' => '1', 'dnf' => 'false',
                           'qualify' => '3', 'dnq' => 'true',
                           'id' => re1.to_param },
                  '1' => { 'finish' => '2', 'dnf' => 'false',
                           'qualify' => '2', 'dnq' => 'true',
                           'id' => re2.to_param },
                  '2' => { 'finish' => '3',
                           'dnf' => 'true', 'qualify' => '1',
                           'dnq' => 'false', 'id' => re3.to_param }
                }
              },
              'commit' => 'Update',
              'season_id' => race.season.to_param,
              'id' => race.to_param
            }
          end
          it 'updates the dependent race entries with the new data' do
            post 'update', params
            expect(RaceEntry.find(re1.id).finish).to be 1
            expect(RaceEntry.find(re2.id).finish).to be 2
            expect(RaceEntry.find(re3.id).finish).to be 3
            expect(RaceEntry.find(re1.id).qualify).to be 3
            expect(RaceEntry.find(re2.id).qualify).to be 2
            expect(RaceEntry.find(re3.id).qualify).to be 1
            expect(RaceEntry.find(re1.id).dnf).to be_falsey
            expect(RaceEntry.find(re1.id).dnq).to be_truthy
          end
          it 'sets the flash notice' do
            post 'update', params
            expect(flash[:notice]).not_to be_nil
          end
          it 'redirects to the race page' do
            post 'update', params
            expect(response).to redirect_to(season_race_path(race.season, race))
          end
        end
        context 'finishing places conflict' do
          let(:params) do
            { 'race' =>
              { 'race_entries_attributes' =>
                { '0' => { 'finish' => '1',
                           'qualify' => '3',
                           'id' => re1.to_param },
                  '1' => { 'finish' => '1',
                           'qualify' => '2',
                           'id' => re2.to_param }
                }
              },
              'commit' => 'Update',
              'season_id' => race.season.to_param,
              'id' => race.to_param
            }
          end
          it 'does not change the race entries' do
            post 'update', params
            myre1 =  RaceEntry.find(re1.id)
            myre2 =  RaceEntry.find(re2.id)
            expect(myre1.finish).to be_nil
            expect(myre2.finish).to be_nil
          end
          it 'sets the flash error' do
            post 'update', params
            expect(flash[:error]).not_to be_nil
          end
          it 'redirects to the race page' do
            post 'update', params
            expect(response).to redirect_to(season_race_path(race.season, race))
          end
        end
      end
      context 'setting the writeup' do
        before(:each) do
          @writeup = 'this is a race writeup'
          @params = { 'race' => { 'writeup' => @writeup },
                      'commit' => 'Update',
                      'season_id' => race.season.to_param,
                      'id' => race.to_param
            }
          post 'update', @params
        end
        it 'updates the race with the writeup info' do
          expect(Race.find(race.id).writeup).to eq(@writeup)
        end
        it 'sets the flash notice' do
          expect(flash[:notice]).not_to be_nil
        end
        it 'redirects to the race page' do
          expect(response).to redirect_to(season_race_path(race.season, race))
        end
      end
    end
  end
end
