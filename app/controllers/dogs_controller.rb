class DogsController < ApplicationController

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def show
    @dog = current_user.dogs.find(params[:id])
  end

  def create
    @user = current_user
    @user.dogs << Dog.create(dog_params)
    if @user.save
      flash[:notice] = "New dog succesfully added"
    else
      flash[:warning] = "Dog couldn't be added"
    end
    redirect_to user_dogs_path
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
    params.require(:dog).permit(:name, :breed, :date_of_birth, :registered, :registered_until, :owner_id)
  end

end
