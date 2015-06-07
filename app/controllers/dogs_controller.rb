class DogsController < ApplicationController

  def update
    @dog = Dog.find(params[:dog])
  end

  def edit
    render :edit
  end

end
