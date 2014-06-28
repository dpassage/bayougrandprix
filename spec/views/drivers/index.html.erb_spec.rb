require 'spec_helper'

describe 'drivers/index', type: :view do
  shared_examples 'driver common admin and guest' do
    it 'shows a table of drivers' do
      assign(:drivers, [])
      render
      expect(rendered).to have_selector('table#drivers')
    end
    context 'with an example driver' do
      let(:player) { stub_model(Player, name: 'David') }
      let(:driver) do
        stub_model(Driver,
                   name: 'Mario',
                   player: player)
      end
      let(:drivers) { [driver] }
      it 'links the driver name to the driver page' do
        assign(:drivers, drivers)
        render
        expect(rendered).to have_link('Mario', href: driver_path(driver))
      end
      it 'links the player name to the player page' do
        assign(:drivers, drivers)
        render
        expect(rendered).to have_link('David', href: player_path(player))
      end
    end
  end
  context 'when the user is not an admin' do
    before(:each) do
      assign(:drivers, [])
      allow(view).to receive(:admin?) { false }
    end
    include_examples 'driver common admin and guest'
    it 'does not have a new driver link' do
      render
      expect(rendered).not_to have_link('New Driver')
    end
  end
  context 'when the user is an administrator' do
    before(:each) do
      assign(:drivers, [])
      allow(view).to receive(:admin?) { true }
    end
    include_examples 'driver common admin and guest'
    it 'has a new driver link' do
      render
      expect(rendered).to have_link('New Driver', href: new_driver_path)
    end
  end
end
