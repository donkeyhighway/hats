class BlackHatController < ApplicationController
  layout 'hats'

  def create
    BlackHat.create!(params[:black_hat].merge(:closed => false))
    return redirect_to(:controller => :sprint, :action => :black_hats)
  end

  def ponder
    @hat = BlackHat.find(params[:id])
  end

  def answer
    @hat = BlackHat.find(params[:id])
    @hat.update_attributes(params[:black_hat])
    if @hat.next
      redirect_to(:action => :ponder, :id => @hat.next.id)
    else
      redirect_to(:controller => :sprint, :action => :done)
    end
  end

  def destroy
    BlackHat.find(params[:id]).hide!
    return redirect_to(:controller => :sprint, :action => :black_hats)
  end
end
