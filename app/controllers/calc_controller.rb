class CalcController < ApplicationController
  def square_new
    render({ :template => "calc_templates/square_new"})
  end

  def square_results
    @num = params.fetch("users_number").to_f
    @result = @num ** 2

    render({ :template => "calc_templates/square_results"})

  end

  def square_root_new
    render({ :template => "calc_templates/square_root_new"})
  end

  def square_root_results
    @num = params.fetch("users_number").to_f
    @result = @num ** 0.5

    render({ :template => "calc_templates/square_root_results"})
  end

  def payment_new
    render({ :template => "calc_templates/payment_new"})
  end

  def payment_results
    @apr = params.fetch("users_apr").to_f
    @years = params.fetch("users_years").to_i
    @principal = params.fetch("users_principal").to_f
    rate = ((@apr/ 100) / 12)
    total_num_payments = 12 * @years
    @result = (@principal * rate) / (1-(1+rate)**(-total_num_payments))

    render({ :template => "calc_templates/payment_results"})
  end

  def random_new
    render({ :template => "calc_templates/random_new"})
  end

  def random_results
    @min = params.fetch("users_minimum").to_f
    @max = params.fetch("users_maximum").to_f
    if @max > @min
      @result = rand(@min..@max) 
    else
      @result = nil 
    end
    
    render({ :template => "calc_templates/random_results"})
  end
end
