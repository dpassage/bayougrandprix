require 'spec_helper'

describe 'Driver Entry Routes', type: :routing do
  let(:season) { FactoryGirl.create(:season) }
  let(:driver_entry) { FactoryGirl.create(:driver_entry, season: season) }
  it 'routes to an edit action' do
    expect(get: edit_season_driver_entry_path(season.id, driver_entry.id)).
      to route_to(controller: 'driver_entries',
                  action: 'edit',
                  season_id: season.id.to_s,
                  id: driver_entry.id.to_s)
  end
  it 'routes to an update action' do
    expect(put: season_driver_entry_path(season.id, driver_entry.id)).
      to route_to(controller: 'driver_entries',
                  action: 'update',
                  season_id: season.id.to_s,
                  id: driver_entry.id.to_s)
  end
end