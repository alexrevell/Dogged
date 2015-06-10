class DogsController < ApplicationController

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = current_user.dogs.new(dog_params)
    if @dog.save
      flash[:notice] = "Your dog #{@dog.name} was succesfully registered until #{@dog.registered_until}. Please pay #{@dog.registration_cost} into bank account 12-1234-1234-01"
      redirect_to user_dogs_path
    else
      flash[:warning] = "Your dog couldn't be registered, please try again"
      redirect_to new_user_dog_path(current_user)
    end
  end

  def update
    @dog = Dog.find(params[:id])

    if @dog.update(dog_params)
      flash[:notice] = "Dog details successfully updated"
    else
      flash[:warning] = "Dog details unable to be updated"
    end
    redirect_to user_dogs_path
  end

  def destroy
    @dog = Dog.find(params[:id])
    if @dog.destroy
      flash[:notice] = "Dog successfully removed"
    else
      flash[:warning] = "Dog could not be removed"
    end
    redirect_to user_dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :date_of_birth, :registered_until, :owner_id)
  end

end
