class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    @games = Game.all

    render json: @games
  end

  def show
    render json: @game
  end

  def create
    @game = Game.new(
      name: params[:name], 
      image_url: params[:image_url], 
      likes: params[:likes]
    )

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def update
    if @game.update(likes: params[:likes])
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy
  end

  private

    def set_game
      @game = Game.find(params[:id])
    end

end
