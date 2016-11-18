class CategoriesController < ApplicationController
  before_action :set_id, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    #@category = Category.find(params[:id])
    @avisos = Aviso.where(category_id: params[:id])
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_id
    @category = Category.find(params[:id])
  end
end
