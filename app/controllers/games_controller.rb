class GamesController < ApplicationController
  def new
  end

  def create
    @game = Game.create!
    @boards = 2.times.map { |x| @game.boards.create! }
    @boards.map(&:randomize_pieces!)

    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])

    # @game.boards.map { |b| b.pieces.destroy_all }
    # @game.boards.map(&:randomize_pieces!)
  end
end
