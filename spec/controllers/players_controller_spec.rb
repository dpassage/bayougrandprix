require 'spec_helper'

describe PlayersController do
  describe "GET index" do
    it_should_behave_like "standard index CRUD", :players
  end
  describe "GET 'new'" do
    it_should_behave_like "standard new CRUD", :player
  end
end
