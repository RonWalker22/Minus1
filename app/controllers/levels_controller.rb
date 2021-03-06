class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /levels
  # GET /levels.json
  def index
    @levels = Level.all
  end

  # GET /levels/1
  # GET /levels/1.json
  def show; end

  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
    begin
      authorize @level
      @game = @level.game
    rescue Pundit::NotAuthorizedError
      flash[:alert] = "You are not authorized to edit this resource."
      redirect_to(request.referrer || root_path)
    end
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = Level.new(level_params)
    if @level.save
      add_contributor(@level.game)
    else
      flash[:alter] = 'Level was not created.'
    end
    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    authorize @level
    unless @level.update(level_params)
      flash[:notice] = 'Level was not created.'
    end

    redirect_to game_path(@level.game)
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    authorize @level
    unless @level.destroy
      flash[:alter] = 'Level was not destroyed.'
    end
    redirect_to game_path(@level.game)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params[:level][:user_id] = current_user.id
      params.fetch(:level, {}).permit(:name, :game_id, :user_id)
    end
end
