class DogsController < ApplicationController

  def update
    @dog = Dog.find(params[:id])

    if @dog.update!(dog_params)
      flash[:notice] = "Dog details successfully updated"
    else
      flash[:warning] = "Dog details unable to be updated"
    end
    redirect_to user_dogs_path
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def show
    render :index
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
    # render plain: params[:dog].inspect
    # @new_dog = Dog.new(dog_params)
    # if @new_dog.save
      # flash[:notice] = "New dog succesfully added"
    # else
      # flash[:warning] = "Dog couldn't be saved"
    # end
    # redirect_to user_dogs_path(current_user)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :date_of_birth, :owner_id)
  end

end
