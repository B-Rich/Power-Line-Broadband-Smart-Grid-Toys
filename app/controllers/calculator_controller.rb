class CalculatorController < ApplicationController
  def index

  end
  
  def calculate
     
      c_fck = Hash.new

      c_fck ["C16/20"] = 16.0
      c_fck ["C20/25"] = 20.0
      c_fck ["C25/30"] = 25.0
      c_fck ["C30/37"] = 30.0
      c_fck ["C35/45"] = 35.0
      c_fck ["C40/50"] = 40.0
      c_fck ["C45/55"] = 45.0
      c_fck ["C50/60"] = 50.0
      c_fck ["C55/67"] = 55.0
      c_fck ["C60/75"] = 60.0
      c_fck ["C70/85"] = 70.0
    
    @conc_exc_class = params[:conc_exc_class].to_i
    @conc_tol_class = params[:conc_tol_class].to_i
    @c_fck = c_fck[params[:c_class]]
    @result = @conc_exc_class * @conc_tol_class + 5 -5

    render "index"
  end
end

