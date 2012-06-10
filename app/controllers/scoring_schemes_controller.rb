class ScoringSchemesController < ApplicationController
  before_filter :authorize, :only => [:create, :update, :destroy]
  def index
    @scoring_schemes = ScoringScheme.all
  end
  def new
    @scoring_scheme = ScoringScheme.new
  end
  def create
    @scoring_scheme = ScoringScheme.new(params[:scoring_scheme])
    begin
      @scoring_scheme.save!
      flash[:notice] = "Scoring scheme #{@scoring_scheme.name} created"
      redirect_to(scoring_schemes_path)
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "Scoring scheme not created"
      render action: "new"
    end
  end
end