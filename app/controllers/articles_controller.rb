class ArticlesController < ApplicationController

  before_action :find_id, only: [:show, :update, :destroy]
  
  def index
    articles = Article.all
    render json @articles, status: 200
  end
  
  def create
    @articule= Articule.new(articule_params)
    
    if @articule.save
      render json: @articule, status:201
    else
      @articule.errors.full_messages
    end
  end
  
  def show
    render json: @articule, status: 200
  end
  
  def update
    if @articule.update(articule_params)
      render json: @articule, status: 202
    else
      @articule.errors.full_messages
    end
  end
  
  def destroy
    @articule.destroy
    render json: @articules, status: 204
  end
  
  private
  
  def articule_params
    params.require(: articule).permai(:title. :body, :user)
  end
  
  def find_id
    @articule= Articule.find(params[:id])
  end
  
end
