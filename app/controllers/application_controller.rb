class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_current_cart, if: ->{ Rails.env.development? }
  helper_method :current_cart

  def current_cart
    @current_cart ||= Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @current_cart.id
    @current_cart
  end

private
  def set_current_cart
    session[:cart_id] = 1
  end

end
