class WelcomeController < ApplicationController
  layout "registro", only: [:index, :new]
  def index
  end
end
