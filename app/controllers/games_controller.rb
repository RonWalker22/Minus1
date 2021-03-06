require 'net/http'
require 'json'

class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :destroy, :switch]
  before_action :set_game_eager, only: [:show]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    @igdb_games = igdb_search if params[:search]
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @maintainers = User.with_role(:maintainer, @game)
    @contributors = User.with_role(:contributor, @game)
    @location = Location.new
    @level = Level.new
    @mode = Mode.new
    @respawn = Respawn.new
    @character = Character.new
    @loadout = Loadout.new
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit; end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game}
        format.json { render :show, status: :created, location: @game }
        current_user.update_attributes game_setting_id: @game.id
        current_user.add_role :contributor, @game
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  def switch
    if @game
      current_user.game_setting_id = @game.id
      current_user.save
    end
    redirect_to @game
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def set_game_eager
      @game = Game.includes(:modes, :characters, levels: [:respawns, :locations]).where(id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.fetch(:game, {}).permit(:website, :name, :status, :image_id, :igdb_id)
    end

    def igdb_search
      http = Net::HTTP.new('api-v3.igdb.com', 80)

      base = 'https://api-v3.igdb.com/games?'
      game_like = "search='#{params[:search]}'&"
      params = "category=0&fields='name','cover.image_id'&limit=24&filter[version_parent][not_exists]=1"
      uri = URI("#{base}#{game_like}#{params}")
      user_key = Rails.application.credentials[:igdb][:user_key]
      request = Net::HTTP::Get.new(uri, 'user-key' => user_key)
      JSON.parse(http.request(request).body)
    end
end
