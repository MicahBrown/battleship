class BoardMovesController < ApplicationController
  def create
    board = Board.find(params[:board_id])
    move = board.board_moves.create!(position: params[:position])

    redirect_to game_path(board.game)
  end
end
