class SprintController < ApplicationController
  layout 'hats'

  def index
    redirect_to(:action => :doorway)
  end

  def doorway
  end

  def new
    @sprint = Sprint.create
    redirect_to(:action => :yellow_hats)
  end

  def yellow_hats
    @hats = [nil] * YellowHat::MAGIC_NUMBER
    YellowHat.all.each do |hat|
      @hats[hat.position] = hat.to_s
    end
  end

  def black_hats
    @hats = [nil] * BlackHat::MAGIC_NUMBER
    @greens = [nil] * BlackHat::MAGIC_NUMBER
    BlackHat.all.each do |hat|
      @hats[hat.position] = hat
      @greens[hat.position] = hat.green_s
    end
  end

  def done
    @hats = [nil] * BlackHat::MAGIC_NUMBER
    @greens = [nil] * BlackHat::MAGIC_NUMBER
    @yellows = [nil] * YellowHat::MAGIC_NUMBER

    BlackHat.all.each do |hat|
      @hats[hat.position] = hat.to_s
      @greens[hat.position] = hat.green_s
    end

    YellowHat.all.each do |hat|
      @yellows[hat.position] = hat.to_s
    end
  end
end
