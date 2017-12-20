class CalculatorController < ApplicationController
  def index

  end
  
  def calculate
     
    #betonin lieriolujuuksien ominaisarvot 
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

    #betonin kuutiolujuuksien ominaisarvot
    c_fck_cube = Hash.new

      c_fck_cube ["C16/20"] = 20.0
      c_fck_cube ["C20/25"] = 25.0
      c_fck_cube ["C25/30"] = 30.0
      c_fck_cube ["C30/37"] = 37.0
      c_fck_cube ["C35/45"] = 45.0
      c_fck_cube ["C40/50"] = 50.0
      c_fck_cube ["C45/55"] = 55.0
      c_fck_cube ["C50/60"] = 60.0
      c_fck_cube ["C55/67"] = 67.0
      c_fck_cube ["C60/75"] = 75.0
      c_fck_cube ["C70/85"] = 85.0
  
  
    #toteutusluokka
    @conc_exc_class = params[:conc_exc_class].to_i
   
    #toleranssiluokka
    @conc_tol_class = params[:conc_tol_class].to_i
    
     #betonin lieriolujuuksien ominaisarvot 
    @c_fck = c_fck[params[:c_class]]
    
    #betonin keskimäärärinen puristuslujuus
    @c_fcm = @c_fck + 8.0
    
    #keskimääräinen vetolujuus fctm
    if @c_fck <= 50.0 
  
      @c_fctm = 0.30 * @c_fck ** (2.0/3.0)
  
    else
      @c_fctm = Math.log(1.0 + (@c_fcm/10.0)) * 2.12
  
    end
    
    #betonin suora vetolujuus
    @c_fctk = 0.7 * @c_fctm

    # betonin osavarmuuskerroin
    if @conc_exc_class <= 2 &&  @conc_tol_class == 1
  
      @c_gamma_c = 1.5
  
    else
      @c_gamma_c = 1.35
  
    end

    # betonin mitoitus puristuslujuus
    @c_fcd = 0.85 * @c_fck / @c_gamma_c

    # betonin keskimääräinen mitoitus puristuslujuus
    @c_fctd = @c_fctk / @c_gamma_c
    
    #Tukireaktoiden laskenta
    @b_load_pd = params[:b_load_pd].to_f
    @b_length = params[:b_length].to_f
    @sup_react_1 = @b_load_pd * @b_length / 2
    @sup_react_2 = @b_load_pd * @b_length / 2

    #Momentin laskenta yksiaukkoinen palkki, tasainen kuorma
    @b_x_dist = params[:b_x_dist].to_f
    @moment_b1_const_load = 0.50 * @b_load_pd * @b_length**2.00 * (@b_x_dist/@b_length - (@b_x_dist/@b_length)**2.00)
    
    @result = @conc_exc_class 

    render :index
  end
end




