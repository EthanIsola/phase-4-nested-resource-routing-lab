class ItemsController < ApplicationController

  def index
    if params[:user_id]
      items = Item.where(user_id: params[:user_id])
      if items === []
        render json: { error: "User not found" }, status: :not_found
      else
        render json: items
      end
    else
      items = Item.all
      render json: items, include: :user
    end
  end

  def show
    if params[:user_id]
      items = Item.find(params[:id])
      if items === []
        render json: { error: "User not found" }, status: :not_found
      else
        render json: items
      end
    else
      items = Item.find(params[:id])
      render json: items, include: :user
    end
  end

  def create
    item = Item.create!(name: params[:name], description: params[:description], price: params[:price], user_id: params[:user_id])
    render json: item, status: :created
  end
end
