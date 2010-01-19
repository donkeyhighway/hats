class YellowHatController < ApplicationController
  def create
    YellowHat.create!(params[:yellow_hat])
    return redirect_to(:controller => :sprint, :action => :yellow_hats)
  end
end
