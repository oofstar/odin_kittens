class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
    if @kittens.count < 1
      @message = "no kittens to display"
    else
      @message = "#{@kittens.count} kittens found"
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    if !@kitten
      @header = "no kitten"
    else
      @header = @kitten.name
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, notice: "Kitten Successfully Added!"
    else
      flash[:notice] = @kitten.errors.full_messages.join(', ')
      render action: 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Kitten Successfully Updated!"
    else
      flash[:notice] = @cutie.errors.full_messages.join(', ')
      render action: 'edit'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to kittens_path, notice: "Kitten Successfully Deleted!"
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
