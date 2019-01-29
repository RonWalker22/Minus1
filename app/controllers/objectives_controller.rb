class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:show, :edit, :update, :destroy]
  before_action :set_simple_attributes, only: [:show]
  before_action :set_variables, only: [:show]

  # GET /objectives
  # GET /objectives.json
  def index
    @objectives = Objective.all
  end

  # GET /objectives/1
  # GET /objectives/1.json
  def show; end

  # GET /objectives/new
  def new
    @selected_strat = params[:strat].to_i
    @strategies = Strategy.all
    @objective = Objective.new
  end

  # GET /objectives/1/edit
  def edit; end

  # POST /objectives
  # POST /objectives.json
  def create
    @objective = Objective.new(objective_params)
    respond_to do |format|
      if @objective.save
        format.html { redirect_to @objective, notice: 'Objective was successfully created.' }
        format.json { render :show, status: :created, location: @objective }
      else
        format.html { render :new }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objectives/1
  # PATCH/PUT /objectives/1.json
  def update
    respond_to do |format|
      if @objective.update(objective_params)
        format.html { redirect_to @objective, notice: 'Objective was successfully updated.' }
        format.json { render :show, status: :ok, location: @objective }
      else
        format.html { render :edit }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1
  # DELETE /objectives/1.json
  def destroy
    @objective.destroy
    respond_to do |format|
      format.html { redirect_to objectives_url, notice: 'Objective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_objective
      @objective = Objective.find(params[:id])
    end

    def set_simple_attributes
      @simple_attributes = {}
      key_skip_list = %w[name id next_id strategy_id master_id]
      value_skip_list = [nil, 0]

      @objective.attributes.each do |key, value|
        next if key_skip_list.include?(key) || value_skip_list.include?(value)

        @simple_attributes[key.capitalize] = value
      end
    end

    def set_variables
      @strategy = Strategy.find(@objective.strategy_id)
      @next = Objective.find(@objective.next_id) if @objective.next
      @master = Objective.find(@objective.master_id) if @objective.master
      @recipes = @objective.recipes
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objective_params
      # rubocop:disable Style/IfUnlessModifier
      if params[:objective][:strategy_id]
        params[:objective][:strategy_id] = params[:objective][:strategy_id].to_i
      end
      # rubocop:enable Style/IfUnlessModifier
      params.fetch(:objective, {}).permit(:name, :target, :action, :strategy_id)
    end
end
