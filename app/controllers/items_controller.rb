class ItemsController < ApplicationController
  
  def index
    @items = @department.items
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
    render partial: "form"
  end

  def create
    @item = @department.items.create(item_params)

    if @item.save
      redirect_to department_item_path(@department, @item.id)
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to [@department, @topic]
    else
      render partial: "form"
    end
  end

  def destroy
    @item.destroy
    redirect_to department_item_path(@department)
  end

  private
  def set_department
    @department = Department.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description)
  end
end




