

class CalculatorController < ApplicationController
  def index

  end
  def calculate
    @x = params[:x].to_i
    @y = params[:y].to_i
    @operation = params[:operation]
    @result = @x * @y

    render "index"
  end
end
