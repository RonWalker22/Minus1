class StrategiesController < ApplicationController
  before_action :set_strategy, only: [:show, :edit, :update, :destroy,
                                      :show_xml]

  # GET /strategies
  # GET /strategies.json
  def index
    @game = Game.find(current_user.game_setting_id || 1)
    authorize @game
    @levels = @game.levels
    @modes = @game.modes
    @strategies = @game.strategies
    @strategy = Strategy.new
  end

  # GET /strategies/1
  # GET /strategies/1.json
  def show
    @game = @strategy.game
    @objectives = @strategy.objectives
    @objective = Objective.new
    @locations = @game.locations
    authorize @strategy
  end

  def show_xml
    render 'show.xml'
  end

  # GET /strategies/new
  def new
    @game = Game.find(current_user.game_setting_id)
    @strategy = Strategy.new
  end

  # GET /strategies/1/edit
  def edit
    @game = @strategy.game
  end

  # POST /strategies
  # POST /strategies.json
  def create
    @strategy = Strategy.new(strategy_params)
    @strategy.uuid = SecureRandom.uuid
    authorize @strategy

    respond_to do |format|
      if @strategy.save
        team_ids = params[:strategy][:team_ids]
        create_strategy_team(team_ids) if team_ids
        format.html { redirect_to strategies_path}
        format.json { render :show, status: :created, location: strategies_path }
      else
        format.html { render :new }
        format.json { render json: @strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strategies/1
  # PATCH/PUT /strategies/1.json
  def update
    respond_to do |format|
      if @strategy.update(strategy_params)
        format.html { redirect_to @strategy }
        format.json { render :show, status: :ok, location: @strategy }
      else
        format.html { render :edit }
        format.json { render json: @strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strategies/1
  # DELETE /strategies/1.json
  def destroy
    authorize @strategy
    @strategy.destroy
    respond_to do |format|
      format.html { redirect_to strategies_url}
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_strategy
      if params[:id]
        @strategy = Strategy.find(params[:id])
      else 
        @strategy = Strategy.find_by(uuid: params[:uuid])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def strategy_params
      params[:strategy][:commander_id] = current_user.id
      params.fetch(:strategy, {}).permit(:mode_id, :name, :commander_id, :level_id, :game_id)
    end

    def create_strategy_team(team_ids)
      team_ids.each do |team_id|
        StrategyTeam.create strategy_id: @strategy.id, team_id: team_id
      end
    end
end