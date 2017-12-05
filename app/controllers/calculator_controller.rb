class CalculatorController < ApplicationController
  def index

  end
  def calculate
    @conc_exc_class = params[:conc_exc_class].to_i
    @conc_tol_class = params[:@conc_tol_class].to_i
    @c_class = params[:c_class]
    @result = @conc_exc_class * @conc_tol_class + 5 -5

    render "index"
  end
end