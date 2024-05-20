# frozen_string_literal: true

class HomePageController < ApplicationController
  def index
    render json: { message: 'Hi!this is sample page' }, status: :ok
  end
end
