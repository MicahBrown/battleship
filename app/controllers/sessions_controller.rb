class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  def new
  end

  def create
  end

  def destroy
  end
end
