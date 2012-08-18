class ItemsController < ApplicationController
  before_filter :authenticate_user!

  # GET /items
  def index
    @items = current_user.items
  end

  # GET /items/1
  def show
    @item = find_item(params[:id])
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = build_item
  end

  # GET /items/1/edit
  def edit
    @item = find_item(params[:id])
  end

  # POST /items
  def create
    @item = build_item(params[:item])

    if @item.save
      redirect_to items_url, notice: 'Item was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /items/1
  def update
    @item = find_item(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to items_url, notice: 'Item was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /items/1
  def destroy
    @item = find_item(params[:id])
    @item.destroy

    redirect_to items_url
  end

  private
    def find_item(id)
      current_user.items.find(id)
    end

    def build_item(params=nil)
      current_user.items.build(params)
    end
end
